require 'rails_helper'

describe "API request" do
  it "can get a successful JSON response of all items" do
    merchant = create(:merchant)
    create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)
    create(:item, merchant_id: merchant.id)

    get '/api/v1/items'

    parsed_data = JSON.parse(response.body)["data"]

    expect(parsed_data.length).to eq(Item.all.length)
  end
end
