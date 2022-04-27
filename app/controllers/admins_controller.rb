class AdminsController < ApplicationController
  before_action :is_admin

  def is_admin
    unless current_user.is_admin?
      flash[:danger] = "Không the truy cap"
      redirect_to root_url
    end
  end
end
