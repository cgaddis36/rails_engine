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

  def revenue
    q = params[:quantity].to_i
    merchants = Merchant.most_revenue(q)
    render json: MerchantSerializer.new(merchants)
  end
end
