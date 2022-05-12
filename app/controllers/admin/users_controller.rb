module Admin
  class UsersController < AdminsController
    before_action :load_user, only: %i[destroy show]

    def index
      @users = User.all.paginate(page: params[:page], per_page: 10)
    end

    def show; end

    def destroy
      if @user.destroy
        flash[:success] = t("flash.success.user_deleted")
      else
        flash[:danger] = t("flash.danger.user_not_deleted")
      end
      redirect_to action: "index"
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def load_user
      @user = User.find_by(id: params[:id])
      return if @user.present?

      flash[:danger] = t("flash.danger.user_not_found")
      redirect_to root_url
    end
  end
end
