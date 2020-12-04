require 'rails_helper'

RSpec.describe PurchaseStreet, type: :model do

  before do
    # 出品者
    # 購入者
    # 商品
    @seller = FactoryBot.create(:user)
    @buyer = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep 1
    @purchase_streets = FactoryBot.build(:purchase_street, user_id: @buyer.id, item_id: @item.id)
  end

  describe '商品情報の入力' do
    context '登録がうまくいくとき' do
      it "全て正常の時" do
        expect(@purchase_streets).to be_valid
      end

      it "building_nameが空の時" do
        @purchase_streets.building_name = ''
        expect(@purchase_streets).to be_valid

      end
    end

    context '登録がうまくいかないとき' do
      it "postal_codeが空だと登録できない" do
        @purchase_streets.postal_code = ''
        @purchase_streets.valid?
        expect(@purchase_streets.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
        it "date_of_shipment_idが空だと登録できない" do
          @purchase_streets.date_of_shipment_id = ''
          @purchase_streets.valid?
          expect(@purchase_streets.errors.full_messages).to include("Date of shipment can't be blank", "Date of shipment is not a number")
        end
        it "addressが空だと登録できない" do
          @purchase_streets.address = ''
          @purchase_streets.valid?
          expect(@purchase_streets.errors.full_messages).to include("Address can't be blank")
        end
        it "phone_numberが空だと登録できない" do
          @purchase_streets.phone_number = ''
          @purchase_streets.valid?
          expect(@purchase_streets.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
        end
        it "郵便番号にはハイフンが必要であること" do
          @purchase_streets.postal_code = '0000000'
          @purchase_streets.valid?
          expect(@purchase_streets.errors.full_messages).to include("Postal code is invalid")
        end
        it "phone_numberがハイフンは不要であること" do
          @purchase_streets.phone_number = '000-000-00000'
          @purchase_streets.valid?
          expect(@purchase_streets.errors.full_messages).to include("Phone number is invalid")
        end
        it "phone_numberが11桁以内であること" do
          @purchase_streets.phone_number = '123456789100'
          @purchase_streets.valid?
          expect(@purchase_streets.errors.full_messages).to include("Phone number is invalid")
        end
        it "tokenが空では登録できないこと" do
          @purchase_streets.token = ''
          @purchase_streets.valid?
          expect(@purchase_streets.errors.full_messages).to include("Token can't be blank")
        end
    end
  end
end