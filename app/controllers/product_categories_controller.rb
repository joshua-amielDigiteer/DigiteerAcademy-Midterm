class ProductCategoriesController < ApplicationController
  before_action :authorize_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
    @pagy, @product_categories = pagy(ProductCategory.all.order(updated_at: :desc), items:7)
  end

  def new
    @product_category = ProductCategory.new
    @product_types = ProductType.all
  end

  def show
    @product_category = ProductCategory.find(params[:id])
  end

  def create
    @product_category = ProductCategory.new(product_category_params)
    if @product_category.save
      redirect_to product_categories_path,
        notice: "<strong>#{@product_category.name}</strong> was successfully created."
        AuditTrail.save_audit(current_user.id, "Create", "Product Category", @product_category.inspect)
    else
      # render :new, status: :unprocessable_entity
      render :new, status: :unprocessable_entity, locals: { errors: @product_category.errors }
    end
  end

  def edit
    @product_category = ProductCategory.find(params[:id])
  end

  def update
    @product_category = ProductCategory.find(params[:id])
    if @product_category.update(product_category_params)
      redirect_to product_categories_path,
        notice: "<strong>#{@product_category.name}</strong> was successfully updated."
        AuditTrail.save_audit(current_user.id, "Edit", "Product Category", @product_category.inspect)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product_category = ProductCategory.find(params[:id])
    if @product_category.destroy
      redirect_to product_categories_path,
        notice: "<strong>#{@product_category.name}</strong> was successfully deleted."
        AuditTrail.save_audit(current_user.id, "Delete", "Product Category", @product_category.inspect)
    end
  end

  private
    def product_category_params
      params.require(:product_category).permit(:name, :description, :product_type_id, :active)
    end

    def authorize_user!
      unless current_user.role_id == 1 || current_user.role_id == 2
        render :file => "public/404.html", alert: "You are not authorized to access this page."
      end
    end
end
