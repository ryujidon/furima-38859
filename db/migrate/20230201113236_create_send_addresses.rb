class CreateSendAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :send_addresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefecture,    null: false
      t.string     :city
      t.string     :house_number
      t.string     :building_name
      t.integer    :phone_number
      t.timestamps
    end
  end
end
