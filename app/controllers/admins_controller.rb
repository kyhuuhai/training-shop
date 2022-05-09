class AdminsController < ApplicationController
  before_action :is_admin

  def is_admin
    unless current_user.is_admin?
      flash[:danger] = t("flash.danger.not_admin")
      redirect_to root_url
    end
  end

  def show
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end
end
