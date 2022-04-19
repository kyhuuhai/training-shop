class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).paginate(page: params[:page], :per_page => 3).ordered_by_price
  end
  def show
    @product = Product.find_by_id(params[:id])
    if @product 
      flash[:info] = "Không tìm thấy thông tin sản phẩm"
      redirect_to products_path   
    end
  end 
end
