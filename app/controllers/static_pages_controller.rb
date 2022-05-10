class StaticPagesController < ApplicationController
  def home
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true).paginate(page: params[:page], :per_page => 4)
  end

  def help
  end
end
