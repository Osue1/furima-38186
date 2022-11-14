class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}/ } 
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ } 
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    record = PurchaseRecord.create(user_id: user_id, product_id: product_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_record_id: record.id)
  end
end