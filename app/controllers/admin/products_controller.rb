module Admin
  class ProductsController < AdminsController
    before_action :set_product, only: %i[edit update destroy]

    def index
      @category = Category.find_by_id(params[:category_id])
      @products = if @category
                    @category.products.all
                             .search_product(params)
                             .paginate(page: params[:page], per_page: 10)
                             .ordered_by_price
                  else
                    Product.search_product(params)
                           .paginate(page: params[:page], per_page: 10)
                           .ordered_by_price
                  end
    end

    def edit; end

    def update
      if @product.update(product_params)
        flash[:success] = t("flash.success.profile_update")
        redirect_to admin_products_path
      else
        render "edit"
      end
    end

    def new
      @product = Product.new
    end

    def create
      @product = Product.new(product_params)
      if @product.save
        flash[:success] = t("flash.success.product_created")
        redirect_to new_admin_product_path
      else
        render "new"
      end
    end

    def destroy
      return unless @product.destroy

      flash[:info] = t("flash.info.deleted")
      redirect_to admin_products_path
    end

    private

    def set_product
      @product = Product.find_by_id(params[:id])
      return if @product

      flash[:info] = t("flash.info.product_not_found")
      redirect_to admin_products_path
    end

    def product_params
      params.require(:product).permit(:name, :code, :price, :description, category_ids: [], images: [])
    end
  end
end
