class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_state
  belongs_to :delivery_charge 
  belongs_to :place 
  belongs_to :delivery_date
  belongs_to :user
  has_one_attached :image


  validates :title,             presence: true
  validates :price,             presence: true ,numericality: {greater_than: 300,less_than: 9999999},format: { with: /\A[0-9]+\z/, message: 'は半角で入力してください' }
  validates :explanation,       presence: true
  validates :category_id,       numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_state_id,     numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :place_id,          numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_date_id,  numericality: { other_than: 1 , message: "can't be blank"} 
  validates :user,              presence: true  
  validates :image,              presence: true  


end
