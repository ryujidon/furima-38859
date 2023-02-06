require 'rails_helper'
RSpec.describe OrderSendAddress, type: :model do
  describe '購入の保存' do
    before do
      user = FactoryBot.create(:user)
      @order_send_address = FactoryBot.build(:order_send_address, user_id: user.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_send_address).to be_valid
      end
      it 'cityは空でも保存できること' do
        @order_send_address.city = ''
        expect(@order_send_address).to be_valid
      end
      it 'addressは空でも保存できること' do
        @order_send_address.address = ''
        expect(@order_send_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_send_address.building_name = ''
        expect(@order_send_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @order_send_address.postal_code = ''
        @order_send_address.valid?
        expect(@order_send_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_send_address.postal_code = '1234567'
        @order_send_address.valid?
        expect(@order_send_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'placeを選択していないと保存できないこと' do
        @order_send_address.place_id = 1
        @order_send_address.valid?
          expect(@order_send_address.errors.full_messages).to include("Place can't be blank")
        end
      it 'telephoneが空だと保存できないこと' do
        @order_send_address.telephone = ''
        @order_send_address.valid?
        expect(@order_send_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_send_address.user_id = nil
        @order_send_address.valid?
        expect(@order_send_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_send_address.item_id = nil
        @order_send_address.valid?
        expect(@order_send_address.errors.full_messages).to include("Item can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @order_send_address.token = nil
        @order_send_address.valid?
        expect(@order_send_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end


