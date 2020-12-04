FactoryBot.define do
  factory :purchase_street do
    postal_code{"111-1111"}
    date_of_shipment_id{0}
    municipality{"東京都港区"}
    address{"南麻布1-1-1"}
    phone_number{"09011111111"}
    building_name{"マンション"}
    token {"tok_abcdefghijk00000000000000000"}

  end
end