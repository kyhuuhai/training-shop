class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == "1" ? remember(user) : forget(user)
      redirect_to products_path
    else
      flash.now[:danger] = t("flash.danger.invalid_login")
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def show; end
end
