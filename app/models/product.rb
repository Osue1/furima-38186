class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one_attached :image
  has_many :product_tag_relations, foreign_key: :product_id, dependent: :destroy
  has_many :tags, through: :product_tag_relations
end
