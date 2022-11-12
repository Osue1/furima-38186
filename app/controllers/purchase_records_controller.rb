class PurchaseRecordsController < ApplicationController
  before_action :set_product, onry: [:index, :create]
  before_action :move_to_top, onry: [:index, :create]
  before_action :move_to_session

  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_address_params)
    if @record_address.valid?
      Payjp.api_key = "sk_test_5373eef08620ebdede418e8b"
      Payjp::Charge.create(
        amount: @product.price,
        card: record_address_params[:token],
        currency: 'jpy'
      )
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def record_address_params
    params.require(:record_address).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
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
