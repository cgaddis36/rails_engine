require 'rails_helper'

describe "API request" do
  it "destroy a single item" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)

    delete "/api/v1/items/#{item.id}"

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data[:id].to_i).to eq(item.id)
    expect(Item.all).to be_empty
  end
end
