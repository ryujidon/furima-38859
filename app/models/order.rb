class Order < ApplicationRecord

  belongs_to :item
  belongs_to :user
  has_one :send_address
  
end
