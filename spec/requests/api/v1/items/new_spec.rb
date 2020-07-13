require 'rails_helper'

describe "API request" do
  it "can get a successfully post a new Item" do
    merchant = create(:merchant)

    post '/api/v1/items', params: { name: Faker::Games::Zelda.item,
                                    description: Faker::TvShows::GameOfThrones.quote,
                                    unit_price: rand(11.2...76.9),
                                    merchant_id: merchant.id
                                    }

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(Item.all.count).to eq(1)

    item = Item.last

    expect(parsed_data[:id].to_i).to eq(item.id)
    expect(parsed_data[:attributes][:name]).to eq(item.name)
  end
end
