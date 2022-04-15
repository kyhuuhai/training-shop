class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).paginate(page: params[:page], :per_page => 4).order('price desc')
  end
  def show
    @product = Product.find(params[:id])
  end
  
end
