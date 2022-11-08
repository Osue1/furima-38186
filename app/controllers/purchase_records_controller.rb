class PurchaseRecordsController < ApplicationController
  before_action :set_product
  before_action :move_to_top
  before_action :move_to_session

  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_address_params)
    if @record_address.valid?
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def record_address_params
    params.require(:record_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number, :card_number, :card_month, :card_year, :card_code).merge(user_id: current_user.id, product_id: @product.id)
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_top
    if PurchaseRecord.exists?(product_id: params[:product_id]) || @product.user_id == current_user.id
      redirect_to root_path
    else
      :index
    end
  end

  def move_to_session
    redirect_to new_user_session_path unless user_signed_in?
  end
end
