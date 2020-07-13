require 'rails_helper'

RSpec.describe "API request" do
  it "can get a successful JSON response of all merchants" do
    create_list(:merchant, 3)
    merchant = Merchant.first

    visit "/api/v1/merchants/#{merchant.id}"

    parsed_data = JSON.parse(page.body)["data"]

    expect(parsed_data["id"].to_i).to eq(merchant.id)
    expect(parsed_data["attributes"]["name"]).to eq(merchant.name)

  end
end
