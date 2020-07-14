require 'rails_helper'

describe "API request" do
  it "update a single item" do
    merchant = create(:merchant)
    item = create(:item, merchant_id: merchant.id)

    patch "/api/v1/items/#{item.id}", params: { name: Faker::Games::Zelda.item,
                                                description: Faker::TvShows::GameOfThrones.quote,
                                                unit_price: rand(11.2...76.9),
                                                merchant_id: merchant.id
                                                }

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data[:id].to_i).to eq(item.id)
    expect(parsed_data[:attributes][:name]).to_not eq(item.name)
  end
end
