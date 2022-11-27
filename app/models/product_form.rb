class ProductForm
  include ActiveModel::Model
  attr_accessor(
    :image, :name, :explanation, :category_id, :status_id, :postage_id,
    :prefecture_id, :days_to_ship_id, :price, :id, :user_id, :created_at,
    :updated_at, :tag_name
  )

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :explanation, length: { maximum: 1000 }
    validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :status_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :postage_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :days_to_ship_id, numericality: { other_than: 1, message: "を選択してください" }
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  def save
    product = Product.create(image: image, name: name, explanation: explanation, category_id: category_id, status_id: status_id, postage_id: postage_id, prefecture_id: prefecture_id, days_to_ship_id: days_to_ship_id, price: price, user_id: user_id)
    tag = Tag.where(tag_name: tag_name).first_or_initialize
    tag.save
    ProductTagRelation.create(product_id: product.id, tag_id: tag.id)
  end

  def update(params, product)
    product.product_tag_relations.destroy_all
    tag_name = params.delete(:tag_name)
    tag = Tag.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    tag.save if tag_name.present?
    product.update(params)
    ProductTagRelation.create(product_id: product.id, tag_id: tag.id) if tag_name.present?
  end
end