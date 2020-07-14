class Api::V1::Items::SearchController < ApplicationController
  def merchant_show
    item = Item.find(params[:id])
    merchant = item.merchant
    render json: MerchantSerializer.new(merchant)
  end
end
