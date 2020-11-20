# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false |
| encrypted_password  | string | null: false |
| first_name          | string | null: false |
| last_name           | string | null: false |
| first_name_kana     | string | null: false |
| last_name_kana      | string | null: false |
| birthday            | date   | null: false |

### Association
- has_many :items
- has_many :purchases_records

## items テーブル

| Column                    | Type    | Options                        |
| ------------------------- | ------- | ------------------------------ |
| product_name              | string  | null: false                    |
| product_description       | text    | null: false                    |
| category_id               | integer | null: false                    |
| product_condition_id      | integer | null: false                    |
| delivery_fee              | integer | null: false                    |
| shipment source           | integer | null: false                    |
| user_id                   | integer | null: false, foreign_key: true |
| date_of_shipment          | integer | null: false                    |
| price                     | integer | null: false                    |

### Association
- belongs_to :user
- has_one :purchase_record

## purchase_record テーブル
| Column  | Type    | Options                        |
| --------| ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false, foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :street_address

## street_address テーブル
| Column          | Type    | Options                           |
| --------------- | ------- | --------------------------------- |
| postal code     | integer | null: false                       |
| prefecture_id   | integer | null: false                       |
| municipality    | string  | null: false                       |
| address         | string  | null: false                       |
| building_name   | string  |                                   |
| phone_number    | string  | null: false                       |
| purchase_record | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase_record