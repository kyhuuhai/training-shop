require "cart"

class OrdersController < ApplicationController
  def index
    @orders = current_user.orders.paginate(page: params[:page], per_page: 4)
  end

  def new
    @cart = current_cart
    @cart_items = get_line_items_in_cart
    if current_cart.empty?
      flash[:info] = t("flash.info.empty_cart")
      redirect_to root_url
    end
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      Cart::add_order_details(current_cart, @order.id)
      session[:cart] = nil
      redirect_to carts_path
    else
      flash[:info] = t("flash.info.empty_cart")
      redirect_to root_url
    end
  end

  private

  def order_params
    params.require(:order).permit(:payment_method_id, :user_id)
  end
end
