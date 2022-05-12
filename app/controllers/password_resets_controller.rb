class PasswordResetsController < ApplicationController
  before_action :load_user, only: %i[edit update]
  before_action :valid_user, only: %i[edit update]

  def new; end

  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = t("flash.info.email_sent")
      redirect_to root_url
    else
      flash.now[:danger] = t("flash.danger.email_not_found")
      render "new"
    end
  end

  def edit; end

  def update
    if password_blank?
      flash.now[:danger] = t("flash.danger.password_blank")
      render "edit"
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = t("flash.success.password_reset")
      redirect_to @user
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def password_blank?
    params[:user][:password].blank?
  end

  def load_user
    @user = User.find_by(email: params[:email])
  end

  def valid_user
    redirect_to root_url unless @user&.activated? && @user&.authenticated?(:reset, params[:id])
  end
end
