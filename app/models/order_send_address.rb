class OrderSendAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :place_id, :city, :address, :building_name, :telephone, :order, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :telephone 
    validates :user_id 
    validates :item_id
  end
    validates :place_id,          numericality: { other_than: 1 , message: "can't be blank"} 

    def save

      order = Order.create(user_id: user_id, item_id: item_id)

      SendAddress.create(postal_code: postal_code, place_id: place_id, city: city, address: address, building_name: building_name, telephone: telephone, order_id: order.id)
    end
end