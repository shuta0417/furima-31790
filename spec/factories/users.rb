FactoryBot.define do
  factory :user do
    nickname {Faker::Internet.username }
    email{Faker::Internet.free_email}
    password {'1a'+ Faker::Internet.password(min_length: 7,max_length: 20)} 
    first_name {"フリマ"}
    last_name {"太郎"}
    first_name_kana {"フリマ"}
    last_name_kana {"タロウ"}
    birthday {"1987-04-17"}
  end
end