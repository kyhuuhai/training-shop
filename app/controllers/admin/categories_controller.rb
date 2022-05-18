module Admin
  class CategoriesController < AdminsController
    before_action :set_category, only: %i[show edit update destroy]

    def index
      @categories = Category.all.paginate(page: params[:page], per_page: 10)
    end

    def show
      @products = @category.products.all.paginate(page: params[:page], per_page: 10)
    end

    def edit; end

    def new
      @category = Category.new
    end

    def create
      @category = Category.new(category_params)
      if @category.save
        flash[:success] = t("flash.success.category_created")
        redirect_to admin_categories_path
      else
        render "new"
      end
    end

    def update
      if @category.update(category_params)
        flash[:success] = t("flash.success.update")
        redirect_to admin_categories_path
      else
        render "edit"
      end
    end

    def destroy
      return unless @category.destroy

      flash[:success] = t("flash.success.deleted")
      redirect_to admin_categories_path
    end

    private

    def set_category
      @category = Category.find_by_id(params[:id])
      return if @category

      flash[:info] = t("flash.info.product_not_found")
      redirect_to admin_categories_path
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
