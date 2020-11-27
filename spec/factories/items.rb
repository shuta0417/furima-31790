FactoryBot.define do
  factory :item do
    name{"サンプル"}
    description{"サンプル"}
    #  factoryBotのカラムとテストコードのカラムの指定を一致させる必要がある
    category_id{2}
    condition_id{2}
    delivery_fee_id{2}
    shipment_source_id{2}
    date_of_shipment_id{2}
    price{300}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
