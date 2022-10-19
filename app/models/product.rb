class Product < ApplicationRecord
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :days_to_ship_id, presence: true
  validates :price, presence: true
  validates :user, presence: true, foreign_key: true
  validates :category_id , numericality: { other_than: 1 }
  validates :status_id , numericality: { other_than: 1 }
  validates :postage_id , numericality: { other_than: 1 }
  validates :prefecture_id , numericality: { other_than: 1 }
  validates :days_to_ship_id , numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :days_to_ship

  has_one_attached :image

end
