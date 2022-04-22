class CartsController < ApplicationController
  before_action :check_empty_cart, only: [:index, :remove_from_cart]
  before_action :get_line_item, only: [:add_to_cart, :remove_from_cart]

  def index
    @cart_items = get_line_items_in_cart
  end

  def add_to_cart
    if @item
      @item["quantity"] += params[:quantity].to_i
      flash[:info] = "Added #{params[:quantity]} #{@product.name} to cart."
    else
      current_cart << { product_id: @product.id, name: @product.name, price: @product.price, quantity: params[:quantity].to_i }
      flash[:success] = "Added #{params[:quantity]} #{@product.name} to cart."
    end
    session[:cart] = current_cart
    redirect_to root_path
  end

  def remove_from_cart
    if @item
      flash[:info] = "Removed #{@item["quantity"]} #{@item["name"]} from cart."
      current_cart.delete(@item)
      session[:cart] = current_cart
      redirect_to carts_path
    end
  end

  private

  def check_empty_cart
    if session[:cart].empty?
      redirect_to root_path
      flash[:info] = "Cart is empty."
    end
  end

  def get_line_item
    @product = Product.find_by(id: params[:id])
    if @product
      @item = find_product_in_cart @product
    else
      redirect_to root_path
    end
  end
end
