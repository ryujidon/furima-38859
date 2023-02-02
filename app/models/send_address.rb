class SendAddress < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :place 
  belongs_to :order
end
