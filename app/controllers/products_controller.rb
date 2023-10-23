class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path,
        notice: "<strong>#{@product.name}</strong> was successfully created."
    else
      # render :new, status: :unprocessable_entity
      render :new, status: :unprocessable_entity, locals: { errors: @product.errors }
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to products_path,
        notice: "<strong>#{@product.name}</strong> was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to products_path,
        notice: "<strong>#{@product.name}</strong> was successfully deleted."
    end
  end

  def categories
    @target = params[:target]
    @categories = ProductCategory.where(product_type_id: params[:product_type_id])
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price, :active, :product_type_id, :product_category_id, product_skus_attributes: [:id, :product_id, :code, :color, :_destroy])
    end
end
