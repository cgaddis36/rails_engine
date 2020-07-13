require 'rails_helper'

describe "API request" do
  it "can get a successfully post a new Merchant" do

    post '/api/v1/merchants', params: { name: "Sports r Us" }

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(Merchant.all.count).to eq(1)

    merchant = Merchant.last

    expect(parsed_data[:id].to_i).to eq(merchant.id)
    expect(parsed_data[:attributes][:name]).to eq(merchant.name)
  end
end

#
