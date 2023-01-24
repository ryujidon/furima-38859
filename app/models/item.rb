class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true
  validates :price, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :item_state_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :place_id, presence: true
  validates :delivery_date_id, presence: true
  validates :user, presence: true  


end
