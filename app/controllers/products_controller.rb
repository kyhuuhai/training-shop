class ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
      .paginate(page: params[:page], per_page: 8)
      .ordered_by_price
  end

  def show
    @product = Product.find_by_id(params[:id])
    if !@product
      flash[:info] = t("flash.info.product_not_found")
      redirect_to products_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :code, :price, :description, :category_ids, images: [])
  end
end
