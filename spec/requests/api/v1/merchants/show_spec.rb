require 'rails_helper'

describe "API request" do
  it "can get a successful JSON response of a single merchant" do
    create_list(:merchant, 3)
    merchant = Merchant.first

    get "/api/v1/merchants/#{merchant.id}"

    parsed_data = JSON.parse(response.body)["data"]

    expect(parsed_data["id"].to_i).to eq(merchant.id)
    expect(parsed_data["attributes"]["name"]).to eq(merchant.name)

  end
end
