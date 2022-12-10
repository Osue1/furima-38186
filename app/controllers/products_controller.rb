class ProductsController < ApplicationController
  before_action :move_to_session, except: [:index, :show, :search]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :move_to_top, only: :edit
  before_action :search

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product_form = ProductForm.new
  end

  def create
    @product = ProductForm.new(product_form_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    product_attributes = @product.attributes
    @product_form = ProductForm.new(product_attributes)
    @product_form.tag_name = @product.tags.first&.tag_name
  end

  def update
    @product_form = ProductForm.new(product_form_params)
    @product_form.image ||= @product.image.blob
    if @product_form.valid?
      @product_form.update(product_form_params, @product)
      redirect_to product_path(params[:id])
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @product.user_id
      @product.destroy
      redirect_to root_path
    end
  end

  def search
    @q = Product.ransack(params[:q])
    @products = @q.result.order('created_at DESC')
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_form_params
    params.require(:product_form).permit(:image, :name, :explanation, :tag_name, :category_id, :status_id, :postage_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_top
    redirect_to root_path if PurchaseRecord.exists?(product_id: params[:id]) || @product.user_id != current_user.id
  end
end
