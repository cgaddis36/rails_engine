
require 'rails_helper'

RSpec.describe "API request" do
  it "can get a successful JSON response of all merchants" do
    create_list(:merchant, 3)

    visit '/api/v1/merchants'
require "pry"; binding.pry
    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    expect(merchants["data"].count).to eq(3)
  end
end
