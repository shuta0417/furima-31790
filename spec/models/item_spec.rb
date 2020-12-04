require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品情報の入力' do
    context '登録がうまくいくとき' do
      it "全て正常の時" do
        expect(@item.valid?).to eq true
      end
    end

    context '登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空だと登録できない" do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "delivery_fee_idが空だと登録できない" do
        @item.delivery_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "shipment_source_idが空だと登録できない" do
        @item.shipment_source_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source can't be blank")
      end
      it "date_of_shipment_idが空だと登録できない" do
        @item.date_of_shipment_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Date of shipment can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが¥300~¥9,999,999の間であること" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが半角数字のみ" do
        @item.price = "１００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが1000万円では保存できない" do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is invalid", "Price is not included in the list")
      end
      it "category_idは1の時は保存できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idは1の時は保存できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "delivery_fee_idは1の時は保存できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end
      it "shipment_source_idは1の時は保存できない" do
        @item.shipment_source_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipment source must be other than 1")
      end
      it "date_of_shipment_idは0の時は保存できない" do
        @item.date_of_shipment_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Date of shipment must be other than 0")
      end
    end
  end
end