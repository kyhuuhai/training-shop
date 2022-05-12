class AdminsController < ApplicationController
  before_action :admin?

  def admin?
    return if current_user.is_admin?

    flash[:danger] = t("flash.danger.not_admin")
    redirect_to root_url
  end

  def show
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end
end
