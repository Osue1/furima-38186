class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number

  with_options presence: true do
    validates :post_code
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :product_id
  end

  def save
    record = PurchaseRecord.create(user_id: user_id, product_id: product_id)
    ShippingAddress.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, purchase_record_id: record.id)
  end
end