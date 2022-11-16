require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @record_address = FactoryBot.build(:record_address, user_id: user.id, product_id: product.id)
    sleep 0.01
  end

  describe '購入機能' do
    context '購入できる場合' do
      it 'buildingが存在しなくても、post_codeとprefecture_idとcityとaddressとphone_numberとuser_idとproduct_idとtokenがあれば購入できる' do
        expect(@record_address).to be_valid
      end
      it 'buildingが存在しても、post_codeとprefecture_idとcityとaddressとphone_numberとuser_idとproduct_idとtokenがあれば購入できる' do
        @record_address.building = nil
        expect(@record_address).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post_codeが空では登録できない' do
        @record_address.post_code = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角でハイフンが含まれないと登録できない' do
        @record_address.post_code = '1234567'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeが半角英数字の「4桁-4桁」では登録できない' do
        @record_address.post_code = '1234-1234'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'post_codeが半角英数字の「3桁-3桁」では登録できない' do
        @record_address.post_code = '123-123'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'prefecture_idが空では登録できない' do
        @record_address.prefecture_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが「1」では登録できない' do
        @record_address.prefecture_id = '1'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @record_address.city = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では登録できない' do
        @record_address.address = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @record_address.phone_number = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが半角英数字12桁以上では登録できない' do
        @record_address.phone_number = '123456789012'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが半角英数字9桁以下では登録できない' do
        @record_address.phone_number = '123456789'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberに半角英数字以外が含まれていると登録できない' do
        @record_address.phone_number = '123-4567-8901'
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'user_idが空では登録できない' do
        @record_address.user_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空では登録できない' do
        @record_address.product_id = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Product can't be blank")
      end
      it 'tokenが空では登録できない' do
        @record_address.token = nil
        @record_address.valid?
        expect(@record_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
