class Api::V1::Merchants::SearchController < ApplicationController
  def create
    merchant = Merchant.create(name: params[:name])
    render json: MerchantSerializer.new(merchant)
  end

  def index
    render json: MerchantSerializer.new(Merchant.all)
  end

  def show
    render json: MerchantSerializer.new(Merchant.find(params[:id]))
  end

  def update
    merchant = Merchant.find(params[:id])
    merchant.update(name: params[:name])
    render json: MerchantSerializer.new(merchant)
  end
end
