class ShippingAddress < ApplicationRecord
  validates :post_code, presence: true
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :building
  validates :phone_number, presence: true

  belongs_to :purchase_record
end
