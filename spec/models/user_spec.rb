require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context 'ユーザ登録ができる時' do
    it "nicknameとemail、passwordとpassword_confirmation、first_name、last_name、first_name_kana、last_name
    _kana、birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    end
    context '新規登録できない場合' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include 'Email has already been taken'
    end
    it 'emailに@が含まれていない場合登録できない' do
      @user.email = 'hogehuga.com'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '890io'
      @user.password_confirmation = '890io'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
    end
    it 'passwordが半角英数字混合でなければ登録できない(数字のみ)' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password は半角英数を両方含む必要があります'
    end
    it 'passwordが半角英数字混合でなければ登録できない(半角英字のみ)' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password は半角英数を両方含む必要があります'
    end
    it 'passwordが半角英数字混合でなければ登録できない(全角)' do
      @user.password = 'ああああああ'
      @user.password_confirmation = 'ああああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Password は半角英数を両方含む必要があります'
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = '890iop'
      @user.password_confirmation = '123qwe'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameが全角文字でなければ登録できない' do
      @user.first_name = 'huga'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name は全角で入力してください'
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'first_nameが全角文字でなければ登録できない' do
      @user.last_name = 'huga'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name は全角で入力してください'
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'first_name_kanaが全角カタカナでなければ登録できない' do
      @user.first_name_kana = 'ｱｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'First name kana はカタカナで入力して下さい。'
    end
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'last_name_kanaが全角カタカナでなければ登録できない' do
      @user.last_name_kana = 'ｱｱｱｱｱ'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Last name kana はカタカナで入力して下さい。'
    end
    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
  end
end
