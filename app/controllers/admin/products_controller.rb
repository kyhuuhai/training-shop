class Admin::ProductsController < AdminsController
  before_action :set_product, only: [:edit, :update, :destroy]

  def index
    @category = Category.find_by_id(params[:category_id])
    if @category
      @products = @category.products.all
        .search_product(params)
        .paginate(page: params[:page], per_page: 10)
        .ordered_by_price
    else
      @products = Product.search_product(params)
        .paginate(page: params[:page], per_page: 10)
        .ordered_by_price
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      flash[:success] = "Profile updated"
      redirect_to admin_products_path
    else
      render "edit"
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      flash[:success] = "Created product sucessfully"
      redirect_to new_admin_product_path
    else
      render "new"
    end
  end

  def destroy
    if @product.destroy
      flash[:info] = "Deleted"
      redirect_to admin_products_path
    end
  end

  private

  def set_product
    @product = Product.find_by_id(params[:id])
    if !@product
      flash[:info] = "Không tìm thấy thông tin sản phẩm"
      redirect_to admin_products_path
    end
  end

  def product_params
    params.require(:product).permit(:name, :code, :price, :description, category_ids: [], images: [])
  end
end
