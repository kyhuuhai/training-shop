class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).paginate(page: params[:page], :per_page => 10)
  end
end
