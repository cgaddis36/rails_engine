class Api::V1::Merchants::SearchController < ApplicationController
  def item_show
    merchant = Merchant.find(params[:id])
    items = merchant.items
    render json: ItemSerializer.new(items)
  end

  def show
    name = params[:name]
    merchant = Merchant.find_merchant(name)
    render json: MerchantSerializer.new(merchant)
  end
end
