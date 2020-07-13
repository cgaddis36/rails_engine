require 'rails_helper'

describe "API request" do
  it "can get a successful JSON response of a single item" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)

    get "/api/v1/items/#{item.id}"

    parsed_data = JSON.parse(response.body)["data"]

    expect(parsed_data["id"].to_i).to eq(item.id)
    expect(parsed_data["attributes"]["name"]).to eq(item.name)
  end
end
