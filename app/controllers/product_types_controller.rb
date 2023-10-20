class ProductTypesController < ApplicationController
  def index
    @product_types = ProductType.all.order(created_at: :desc)
  end

  def new
    @product_type = ProductType.new
  end

  def show
    @product_type = ProductType.find(params[:id])
  end

  def create
    @product_type = ProductType.new(product_type_params)
    if @product_type.save
      redirect_to product_types_path,
        notice: "<strong>#{@product_type.name}</strong> was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @product_type = ProductType.find(params[:id])
  end

  def update
    @product_type = ProductType.find(params[:id])
    if @product_type.update(product_type_params)
      redirect_to product_types_path,
        notice: "<strong>#{@product_type.name}</strong> was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product_type = ProductType.find(params[:id])
    if @product_type.destroy
      redirect_to product_types_path,
        notice: "<strong>#{@product_type.name}</strong> was successfully deleted."
    end
  end

  private
    def product_type_params
      params.require(:product_type).permit(:name, :description, :active)
    end
end
