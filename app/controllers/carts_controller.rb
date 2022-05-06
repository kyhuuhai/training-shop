class CartsController < ApplicationController
  before_action :check_empty_cart, only: [:index, :remove_from_cart]
  before_action :get_line_item, only: [:add_to_cart, :remove_from_cart]
  before_action :update_quantity, only: [:update_cart]

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

  def update_cart
    current_cart.each do |item|
      for i in 0..@length - 1
        item["quantity"] = @quantity_item[i].to_i if item["product_id"] == params[:item_carts]["#{i}"]["id"].to_i
      end
    end
    session[:cart] = current_cart
    redirect_to carts_path
  end

  private

  def check_empty_cart
    if session[:cart].nil?
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

  def update_quantity
    @item_carts = params[:item_carts]
    @quantity_item = []
    @length = @item_carts.keys.length
    for item_cart in 0..@length - 1
      if item_cart
        @quantity_item << @item_carts[item_cart.to_s]["quantity"]
      end
    end
  end
end
