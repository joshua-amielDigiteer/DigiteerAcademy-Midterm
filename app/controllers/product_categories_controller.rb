class ProductCategoriesController < ApplicationController
  def index
    @product_categories = ProductCategory.all
  end

  def new
    @product_category = ProductCategory.new
  end

  def show
    @product_category = ProductCategory.find(params[:id])
  end

  def create
    @product_category = ProductCategory.new(product_category_params)
  end

  def edit
    @product_category = ProductCategory.find(params[:id])
  end

  def update
    @product_category = ProductCategory.find(params[:id])
    if @product_category.update(product_category_params)
      redirect_to product_category_path,
        notice: "<strong>#{@product_category.name}</strong> was successfully updated."
    else
      render :edit, status: :unprocessable_entity
  end

  def destroy
    @product_category = ProductCategory.find(params[:id])
    if @product_category.destroy
      redirect_to product_categories_path,
        notice: "<strong>#{@product_category.name}</strong> was successfully deleted."
    end
  end

  private
    def product_category_params
      params.require(:product_category).permit(:name, :description)
    end
  end
end
