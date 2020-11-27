class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options  presence: true do
    validates :name, presence: true
    validates :description
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :shipment_source_id
    validates :date_of_shipment_id
    validates :price
  end

  with_options  presence: true do
    validates :category_id, numericality: { other_than: 1 }
    validates :condition_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :shipment_source_id, numericality: { other_than: 1 }
    validates :date_of_shipment_id, numericality: { other_than: 1 }
  end
  
  validates :price,format: { with:/\A^[0-9]+$\z/}
  validates_inclusion_of :price, in: 300..9999999
end
