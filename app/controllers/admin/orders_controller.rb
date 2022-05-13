module Admin
  class OrdersController < AdminsController
    before_action :set_category, only: %i[show edit update destroy]

    def index
      @orders = Order.all.paginate(page: params[:page], per_page: 10)
    end

    def edit; end

    def destroy
      return unless @category.destroy

      flash[:success] = "Delete succesfully"
      redirect_to admin_categories_path
    end

    private

    def set_category
      @category = Category.find_by_id(params[:id])
      return if @category

      flash[:info] = "Không tìm thấy thông tin sản phẩm"
      redirect_to admin_categories_path
    end

    def category_params
      params.require(:category).permit(:name)
    end
  end
end
