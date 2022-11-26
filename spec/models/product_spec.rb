require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '出品機能' do
    context '出品できる場合' do
      it 'imageとnameとexplanationとpriceが存在し、categoryとstatusとpostageとprefectureとdays_to_shipとuserが紐付いていれば出品できる' do
        expect(@product).to be_valid
      end
    end
    context '出品できない場合' do
      it 'imageが存在していないと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが存在していないと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが41文字以上では出品できない' do
        @product.name = Faker::Name.initials(number: 41)
        @product.valid?
        expect(@product.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end
      it 'explanationが存在していないと出品できない' do
        @product.explanation = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'explanationが1001文字以上では出品できない' do
        @product.explanation = Faker::Lorem.sentence(word_count: 1001)
        @product.valid?
        expect(@product.errors.full_messages).to include('Explanation is too long (maximum is 1000 characters)')
      end
      it 'categoryが紐付いていないと出品できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category を選択してください")
      end
      it 'categoryが「---」(id: 1)以外でないと出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category を選択してください")
      end
      it 'statusが紐付いていないと出品できない' do
        @product.status_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Status を選択してください")
      end
      it 'stsatusが「---」(id: 1)以外でないと出品できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status を選択してください")
      end
      it 'postageが紐付いていないと出品できない' do
        @product.postage_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Postage を選択してください")
      end
      it 'postageが「---」(id: 1)以外でないと出品できない' do
        @product.postage_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Postage を選択してください")
      end
      it 'prefectureが紐付いていないと出品できない' do
        @product.prefecture_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture を選択してください")
      end
      it 'prefectureが「---」(id: 1)以外でないと出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture を選択してください")
      end
      it 'days_to_shipが紐付いていないと出品できない' do
        @product.days_to_ship_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Days to ship can't be blank")
      end
      it 'days_to_shipが「---」(id: 1)以外でないと出品できない' do
        @product.days_to_ship_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Days to ship を選択してください")
      end
      it 'userがが紐付いていないと出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
      it 'priceが存在していないと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが10000000以上では出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
