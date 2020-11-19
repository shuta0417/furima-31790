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
- has_many :purchase_record

## items テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| product_name         | string  | null: false |
| product_description  | string  | null: false |
| category_id          | integer | null: false |
| product_condition_id | integer | null: false |
| delivery_fee         | integer | null: false |
| shipment source      | integer | null: false |
| user_id              | integer | null: false |
| date_of_shipment     | integer | null: false |
| price                | integer | null: false |

### Association
- belongs_to :users
- has_one :purchase_record

## purchase_record
| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| user_id  | integer | null: false |
| items_id | integer | null: false |

### Association
- belongs_to :items
- has_one :street_address

## street_address テーブル
| Column        | Type    | Options     |
| --------------| ------- | ----------- |
| postal code   | integer | null: false |
| prefectures   | integer | null: false |
| municipality  | integer | null: false |
| address       | integer | null: false |
| building_name | integer | null: false |
| phone_number  | integer | null: false |

### Association
- belongs_to :purchase_record