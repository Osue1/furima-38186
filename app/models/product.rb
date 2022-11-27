class Product < ApplicationRecord
  validates :image, presence: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :status_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :postage_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :days_to_ship_id, presence: true, numericality: { other_than: 1, message: "を選択してください" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :days_to_ship
  has_one_attached :image
  has_many :product_tag_relations
  has_many :tags, through: :product_tag_relations
end
