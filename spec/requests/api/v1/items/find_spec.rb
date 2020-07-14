require 'rails_helper'

describe "Api Find endpoints" do
  it "can find the correct item for that find parameter" do
    merchant = Merchant.create!(name: "Turing")
    item = merchant.items.create!(
                                  name: "Hungry Hippo",
                                  description: "The hungriest hippo alive",
                                  unit_price: 33
                                  )
    merchant.items.create!(
                            name: "Hipster Hamburger",
                            description: "Hippies love em",
                            unit_price: 3
                            )
    merchant.items.create!(
                            name: "Hungry Horace",
                            description: "The hungriest doll around",
                            unit_price: 12
                            )

    get "/api/v1/items/find?name=hip"

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data[:attributes][:name]).to eq(item.name)
  end
  it "can find all the items for that find_all parameter" do
    merchant = Merchant.create!(name: "Turing")
    item = merchant.items.create!(
                                  name: "Hungry Hippo",
                                  description: "The hungriest hippo alive",
                                  unit_price: 33
                                  )
    merchant.items.create!(
                            name: "Hipster Hamburger",
                            description: "Hippies love em",
                            unit_price: 3
                            )
    merchant.items.create!(
                            name: "Hungry Horace",
                            description: "The hungriest doll around",
                            unit_price: 12
                            )


    get "/api/v1/items/find_all?name=hip"

    parsed_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed_data.count).to eq(2)
    expect(parsed_data.count).to_not eq(Item.all.count)
  end
end
