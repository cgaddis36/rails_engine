require 'rails_helper'

describe "API request" do
  it "can get a successful JSON response of all merchants" do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    parsed_data = JSON.parse(response.body)["data"]

    expect(parsed_data.length).to eq(Merchant.all.length)
  end
end
