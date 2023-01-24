class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category ,:item_state ,:delivery_charge ,:place ,:delivery_date 

  validates :title,             presence: true
  validates :price,             presence: true
  validates :explanation,       presence: true
  validates :category_id,       numericality: { other_than: 1 , message: "can't be blank"} 
  validates :item_state_id,     numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :place_id,          numericality: { other_than: 1 , message: "can't be blank"} 
  validates :delivery_date_id,  numericality: { other_than: 1 , message: "can't be blank"} 
  validates :user,              presence: true  


end
