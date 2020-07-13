require 'rails_helper'

describe "API request" do
  it "find all items for a single merchant" do
    merchant = create(:merchant)
    create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)

    merchant = Merchant.last

    get "/api/v1/merchants/#{merchant.id}/items"

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data.count).to eq(merchant.items.count)
  end
end
