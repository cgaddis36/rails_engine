require 'rails_helper'

describe "Api Find endpoints" do
  it "can find the correct merchant for that find parameter" do
    merchant = Merchant.create!(name: "Turing")
    Merchant.create!(name: "Ring World")
    Merchant.create!(name: "Notterham Wolves")

    get "/api/v1/merchants/find?name=ring"

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data[:attributes][:name]).to eq(merchant.name)
  end
  it "can find the all merchants for that find_all parameter" do
    merchant = Merchant.create!(name: "Turing")
    Merchant.create!(name: "Ring World")
    Merchant.create!(name: "Notterham Wolves")

    get "/api/v1/merchants/find_all?name=ring"

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data.count).to eq(2)
    expect(parsed_data.count).to_not eq(Merchant.all.count)
  end
end
