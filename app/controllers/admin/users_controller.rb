class Admin::UsersController < AdminsController
  before_action :load_user, only: [:destroy, :show]

  def index
    @users = User.all.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def destroy
    if @user.destroy
      flash[:success] = "Deleted thành công!"
      redirect_to :action => "index"
    else
      flash[:danger] = "Deleted khong thanh cong!"
      redirect_to :action => "index"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def load_user
    @user = User.find_by(id: params[:id])
    return if @user.present?
    flash[:danger] = "Không tìm thấy user"
    redirect_to root_url
  end
end
