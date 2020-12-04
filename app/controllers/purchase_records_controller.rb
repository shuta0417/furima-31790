class PurchaseRecordsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @purchase_record = PurchaseStreet.new
  end

  def create
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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_record_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
