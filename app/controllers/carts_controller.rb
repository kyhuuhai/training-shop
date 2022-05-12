require "cart"

class CartsController < ApplicationController
  before_action :check_empty_cart, only: %i[index remove_from_cart]
  before_action :load_line_item, only: %i[add_to_cart remove_from_cart]
  before_action :update_quantity, only: [:update_cart]

  def index
    @cart_items = load_line_items_in_cart
  end

  def add_to_cart
    if @item
      @item["quantity"] += params[:quantity].to_i
      flash[:info] = t("flash.info.add") + "#{params[:quantity]} #{@product.name}" + t("flash.info.to_cart")
    else
      images = []
      @product.images.each do |img|
        images << url_for(img)
      end
      current_cart << { product_id: @product.id, name: @product.name, price: @product.price,
                        quantity: params[:quantity].to_i, images: images }
      flash[:success] = t("flash.success.added") + "#{params[:quantity]} #{@product.name}" + t("flash.info.to_cart")
    end
    session[:cart] = current_cart
    redirect_to root_path
  end

  def remove_from_cart
    return unless @item

    flash[:info] = t("flash.info.removed") + "#{@item["quantity"]} #{@item["name"]}" + t("flash.info.from_cart")
    current_cart.delete(@item)
    session[:cart] = current_cart
    redirect_to carts_path
  end

  def update_cart
    current_cart.each do |item|
      (0..@length - 1).each do |i|
        item["quantity"] = @quantity_item[i].to_i if item["product_id"] == params[:item_carts][i.to_s]["id"].to_i
      end
    end
    session[:cart] = current_cart
    redirect_to carts_path
  end

  private

  def check_empty_cart
    return unless session[:cart].nil?

    redirect_to root_path
    flash[:info] = t("flash.info.empty_cart")
  end

  def load_line_item
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
    (0..@length - 1).each do |item_cart|
      @quantity_item << @item_carts[item_cart.to_s]["quantity"] if item_cart
    end
  end
end
