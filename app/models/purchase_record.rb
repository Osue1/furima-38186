class PurchaseRecord < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :shipping_address
end
