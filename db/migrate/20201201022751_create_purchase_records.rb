class CreatePurchaseRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :purchase_records do |t|
      t.integer :user_id, foreign_key: true
      t.integer :item_id, foreign_key: true
      t.timestamps
    end
  end
end