# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| first_name          | string | null: false               |
| last_name           | string | null: false               |
| first_name_kana     | string | null: false               |
| last_name_kana      | string | null: false               |
| birthday            | date   | null: false               |

### Association
- has_many :items
- has_many :purchases_records

## items テーブル

| Column                    | Type    |Options                        
| ------------------------- | ------- --------------------
| name                      | string  |null:false                    
| description               | text    |null:false                    
| category_id               | integer |null:false                    
| condition_id              | integer |null:false                    
| delivery_fee_id           | integer |null:false                    
| shipment_source_id        | integer |null:false                    
| user_id                   | integer |foreign_key:true              
| date_of_shipment_id       | integer |null:false                    
| price                     | integer |null:false                    

### Association
- belongs_to :user
- has_one :purchase_record

## purchase_record テーブル
| Column  | Type    | Options                        |
| --------| ------- | ------------------------------ |
| user_id | integer | foreign_key: true              |
| item_id | integer | foreign_key: true              |

### Association
- belongs_to :item
- belongs_to :user
- has_one :street_address


## street_address テーブル
| Column          | Type       | Options                           |
| --------------- | ---------  | --------------------------------- |
| postal_code     | string     | null: false                       |
| prefecture_id   | integer    | null: false                       |
| municipality    | string     | null: false                       |
| address         | string     | null: false                       |
| building_name   | string     |                                   |
| phone_number    | string     | null: false                       |
| purchase_record | references | foreign_key: true                 |


### Association
- belongs_to :purchase_record
