class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :shipment_source_id, presence: true
  validates :date_of_shipment_id, presence: true
  validates :price, presence: true
  validates :price, inclusion: { in: 300..9999999 }
  validates :price,format: { with:/\A^[0-9]+$\z/}
end
