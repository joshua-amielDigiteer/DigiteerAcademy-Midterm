class ProductTypesController < ApplicationController
  before_action :authorize_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @pagy, @product_types = pagy(ProductType.all.order(updated_at: :desc), items:7)
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
        AuditTrail.save_audit(current_user.id, "Create", "Product Type", @product_type.inspect)
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
        AuditTrail.save_audit(current_user.id, "Edit", "Product Type", @product_type.inspect)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product_type = ProductType.find(params[:id])
    if @product_type.destroy
      redirect_to product_types_path,
        notice: "<strong>#{@product_type.name}</strong> was successfully deleted."
        AuditTrail.save_audit(current_user.id, "Delete", "Product Type", @product_type.inspect)
    end
  end

  private
    def product_type_params
      params.require(:product_type).permit(:name, :description, :active)
    end

    def authorize_user!
      unless current_user.role_id == 1 || current_user.role_id == 2
        render "partials/404.html"
      end
    end
end
