class Api::V1::Merchants::SearchController < ApplicationController
  def index
    name = params[:name]
    merchants = Merchant.find_merchants(name)
    render json: MerchantSerializer.new(merchants)
  end

  def show
    name = params[:name]
    merchant = Merchant.find_merchant(name)
    render json: MerchantSerializer.new(merchant)
  end

  def item_show
    merchant = Merchant.find(params[:id])
    items = merchant.items
    render json: ItemSerializer.new(items)
  end

end
