class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery_charge 
  belongs_to :place 
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image
  has_one :order


  validates :title,             presence: true
  validates :price,             presence: true ,numericality: {greater_than: 300,less_than: 9999999 ,only_integer: true}
  validates :explanation,       presence: true
  validates :category_id,       numericality: { other_than: 1 , message: "を選択してください"} 
  validates :item_state_id,     numericality: { other_than: 1 , message: "を選択してください"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "を選択してください"} 
  validates :place_id,          numericality: { other_than: 1 , message: "を選択してください"} 
  validates :delivery_date_id,  numericality: { other_than: 1 , message: "を選択してください"} 
  validates :image,              presence: true  


end
