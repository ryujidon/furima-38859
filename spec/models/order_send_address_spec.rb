require 'rails_helper'
RSpec.describe OrderSendAddress, type: :model do
  describe '購入の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_send_address = FactoryBot.build(:order_send_address, user_id: user.id ,item_id:item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
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
        expect(@order_send_address.errors.full_messages).to include("Postal code は-（ハイフン）を含めた半角数字で入力してください")
      end
      it 'placeを選択していないと保存できないこと' do
        @order_send_address.place_id = 1
        @order_send_address.valid?
          expect(@order_send_address.errors.full_messages).to include("Place を選択してください")
        end
        it 'cityが空だと保存できないこと' do
          @order_send_address.city = ''
          @order_send_address.valid?
          expect(@order_send_address.errors.full_messages).to include("City can't be blank")
        end
        it 'addressが空だと保存できないこと' do
          @order_send_address.address = ''
          @order_send_address.valid?
          expect(@order_send_address.errors.full_messages).to include("Address can't be blank")
        end
      it 'telephoneが空だと保存できないこと' do
        @order_send_address.telephone = ''
        @order_send_address.valid?
        expect(@order_send_address.errors.full_messages).to include("Telephone can't be blank")
      end
      it 'telephoneが9桁以下では購入できない' do
        @order_send_address.telephone = '00000000'
        @order_send_address.valid?
        expect(@order_send_address.errors.full_messages).to include("Telephone  は10桁〜11桁で半角数字のみで入力してください")
      end
      it 'telephoneが12桁以上では購入できない' do
        @order_send_address.telephone = '000000000000'
        @order_send_address.valid?
        expect(@order_send_address.errors.full_messages).to include("Telephone  は10桁〜11桁で半角数字のみで入力してください")
      end
      it 'telephoneに半角数字以外が含まれている場合は購入できない' do
        @order_send_address.telephone = '000000000あ0'
        @order_send_address.valid?
        expect(@order_send_address.errors.full_messages).to include("Telephone  は10桁〜11桁で半角数字のみで入力してください")
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


