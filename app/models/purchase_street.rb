class PurchaseStreet
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :date_of_shipment_id, :municipality, :address, :building_name, :phone_number, :purchase_record, :token

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code
    validates :date_of_shipment_id, numericality: { other_than: 1 }
    validates :municipality
    validates :address
    validates :phone_number 
    validates :token
  end
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
    #validates :phone_number, numericality:

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(postal_code: postal_code, date_of_shipment_id: date_of_shipment_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end