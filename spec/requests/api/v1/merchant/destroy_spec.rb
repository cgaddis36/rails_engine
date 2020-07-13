require 'rails_helper'

describe "API request" do
  it "update a single merchant" do
    create(:merchant)

    merchant = Merchant.last

    delete "/api/v1/merchants/#{merchant.id}"

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data[:id].to_i).to eq(merchant.id)
    expect(Merchant.all).to be_empty
  end
end
