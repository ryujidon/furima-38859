class OrderSendAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :place_id, :city, :address, :building_name, :telephone, :order, :user_id, :item_id,:token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone, format: {with: /\A\d{10,11}\z/,message: "is invalid. Include hyphen(-)"}
    validates :user_id 
    validates :item_id
    validates :token
    validates :city
    validates :address
  end
    validates :place_id,          numericality: { other_than: 1 , message: "can't be blank"} 

    def save

      order = Order.create(user_id: user_id, item_id: item_id)

      SendAddress.create(postal_code: postal_code, place_id: place_id, city: city, address: address, building_name: building_name, telephone: telephone, order_id: order.id)
    end
end