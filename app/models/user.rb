class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' }
  validates :first_name_kana, presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: 'はカタカナで入力して下さい。' }
  validates :last_name_kana, presence: true, format: { with: /[\p{katakana} ー－&&[^ -~｡-ﾟ]]+/, message: 'はカタカナで入力して下さい。' }
  validates :birthday, presence: true

  has_many :prototypes
  has_many :comments

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }
end
