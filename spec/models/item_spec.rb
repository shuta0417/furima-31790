require 'rails_helper'

RSpec.describe Item, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @items = FactoryBot.build(:item)
  end

  describe '商品情報の入力' do
    context '登録がうまくいくとき' do
      it "全て正常の時" do
        expect(@items.valid?).to eq true
      end
    end

    context '登録がうまくいかないとき' do
      it "nameが空だと登録できない" do
        @items.name = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと登録できない" do
        @items.description = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが空だと登録できない" do
        @items.category_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Category can't be blank")
      end
      it "condition_idが空だと登録できない" do
        @items.condition_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Condition can't be blank")
      end
      it "delivery_fee_idが空だと登録できない" do
        @items.delivery_fee_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "shipment_source_idが空だと登録できない" do
        @items.shipment_source_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Shipment source can't be blank")
      end
      it "date_of_shipment_idが空だと登録できない" do
        @items.date_of_shipment_id = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Date of shipment can't be blank")
      end
      it "priceが空だと登録できない" do
        @items.price = ''
        @items.valid?
        expect(@items.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが¥300~¥9,999,999の間であること" do
        @items.price = 100
        @items.valid?
        expect(@items.errors.full_messages).to include("Price is not included in the list")
      end
      it "priceが半角数字のみ" do
        @items.price = "１００"
        @items.valid?
        expect(@items.errors.full_messages).to include("Price is not included in the list")
      end

    end
  end
end