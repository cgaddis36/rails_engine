class Api::V1::Items::SearchController < ApplicationController
  def index
    name = params[:name]
    items = Item.find_items(name)
    render json: ItemSerializer.new(items)
  end

  def show
    item_name = params[:name]
    item = Item.find_item(item_name)
    render json: ItemSerializer.new(item)
  end

  def merchant_show
    item = Item.find(params[:id])
    merchant = item.merchant
    render json: MerchantSerializer.new(merchant)
  end
end
