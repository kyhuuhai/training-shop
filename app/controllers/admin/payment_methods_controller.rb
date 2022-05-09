class Admin::PaymentMethodsController < ApplicationController
  before_action :set_payment_method, only: [:edit, :update, :destroy]
  
  def index
    @payment_methods = PaymentMethod.all.paginate(page: params[:page], per_page: 10)
  end

  def edit
  end

  def update
    if @payment_method.update(payment_method_params)
      flash[:success] = "updated"
      redirect_to admin_payment_methods_path
    else
      render :edit
    end
  end

  def new
    @payment_method = PaymentMethod.new
  end

  def create
    @payment_method = PaymentMethod.new(payment_method_params)
    if @payment_method.save
      flash[:success] = "Created payment method sucessfully"
      redirect_to new_admin_payment_method_path
    else
      render :new
    end
  end

  def destroy
    if @payment_method.destroy 
      flash[:info] = "Deleted"
      redirect_to admin_payment_methods_path
    end
  end

  private 

    def set_payment_method
      @payment_method = PaymentMethod.find_by_id(params[:id])
      return unless @payment_method
      flash[:danger] = "Khong tim thây thông tin"
      redirect_to admin_payment_methods_path 
    end
    def payment_method_params
      params.require(:payment_method).permit(:name)
    end
end
