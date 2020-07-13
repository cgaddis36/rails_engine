require 'rails_helper'

RSpec.describe "API request" do
  it "can get a successful JSON response of all merchants" do
    create_list(:merchant, 3)

    visit '/api/v1/merchants'

    parsed_data = JSON.parse(page.body)["data"]

    expect(parsed_datau.count).to eq(3)
  end
end
