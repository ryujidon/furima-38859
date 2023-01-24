class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|


      t.string :title
      t.integer :price
      t.text :explanation
      t.integer :category_id
      t.integer :item_state_id
      t.integer :delivery_charge_id
      t.integer :place_id
      t.integer :delivery_date_id
      t.references :user, null: false, foreign_key: true



      t.timestamps
    end
  end
end
