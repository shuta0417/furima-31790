class PurchaseRecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_record = PurchaseStreet.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_record = PurchaseStreet.new(purchase_record_params)
    if @purchase_record.valid?
      pay_item
      @purchase_record.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_record_params
    params.permit(:postal_code, :date_of_shipment_id, :municipality, :address, :building_name, :phone_number, :item_id, :token).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_57f9c550a7b70a33a9057c46"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
