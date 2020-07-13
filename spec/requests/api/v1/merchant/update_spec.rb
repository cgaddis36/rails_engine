require 'rails_helper'

describe "API request" do
  it "update a single merchant" do
    create(:merchant)

    merchant = Merchant.last

    name = "New name"

    patch "/api/v1/merchants/#{merchant.id}", params: { name: name }

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data[:id].to_i).to eq(merchant.id)
    expect(parsed_data[:attributes][:name]).to eq(name)
  end
end
