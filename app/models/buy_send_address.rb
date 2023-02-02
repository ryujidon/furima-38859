class BuySendAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :place_id, :city,:address, :building_name,:telephone,:user_id,:item_id

  with_options presence: true do
    validates :place_id,          numericality: { other_than: 1 , message: "can't be blank"} 
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone 
    validates :user_id 
    validates :item_id

    def save

      Buy = Buy.create(price: price, user_id: user_id ,:item_id item_id )

      SendAddress.create(postal_code: postal_code, place_id: place_id, city: city, address: address, building_name: building_name, telephone: telephone, buy_id: buy.id)
    end
end