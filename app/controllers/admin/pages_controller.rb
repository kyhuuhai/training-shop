class Admin::PagesController < ApplicationController
  def report
    @date_begin = params["date_begin"].nil? ? 1.month.ago.to_date : param_to_date("date_begin")
    @date_end = params["date_end"].nil? ? Date.current : param_to_date("date_end")
    flash.now[:error] = "Please pick a valid date." if @invalid_date
    if params["id"].nil? || params["id"] == ""
      @symptom_id = ""
      @symptoms_ids = @symptoms.map(&:id)
      @all_symptoms_first_chart = @user.daily_levels_and_dates_for_symptoms_in_date_range(@date_begin, @date_end, @symptoms_ids)
      @all_symptoms_second_chart = @user.daily_levels_and_dates_for_all_symptoms(@symptoms_ids)
      @ratio_all_symptoms = ratio_all_symptoms(@date_begin, @date_end)
    else
      @symptom = @symptoms.find(params["id"])
      @symptom_id = @symptom.id
      @one_symptom_first_chart = @user.daily_levels_and_dates_for_symptom_in_date_range(@date_begin, @date_end, @symptom_id)
      @one_symptom_second_chart = @user.daily_levels_and_dates_for_symptom(@symptom_id)
      @ratio_one_symptom = ratio_one_symptom(@one_symptom_first_chart)
    end
  end
end
