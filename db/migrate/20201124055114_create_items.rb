class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false 
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :shipment_source_id, null: false
      t.integer :user_id, foreign_key: true
      t.integer :date_of_shipment_id, null: false
      t.integer :price, null: false
      t.timestamps
    end
  end
end
## items テーブル