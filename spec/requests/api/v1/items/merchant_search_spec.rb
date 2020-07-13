require 'rails_helper'

describe "API request" do
  it "find all items for a single merchant" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)

    get "/api/v1/items/#{item.id}/merchant"

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data[:attributes][:name]).to eq(merchant.name)
  end
end
