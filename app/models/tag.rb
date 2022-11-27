class Tag < ApplicationRecord
  validates :tag_name,  uniqueness: true

  has_many :product_tag_relations
  has_many :products, through: :product_tag_relations
end
