class Api::V1::Merchants::SearchController < ApplicationController
  def show
    merchant = Merchant.find(params[:id])
    items = merchant.items
    render json: ItemSerializer.new(items)
  end
end
