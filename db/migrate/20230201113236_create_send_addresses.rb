class CreateSendAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :send_addresses do |t|
      t.string     :postal_code,   null: false
      t.integer    :place_id , null: false
      t.string     :city ,null: false
      t.string     :address ,null: false
      t.string     :building_name
      t.integer    :telephone ,null: false
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
