
require 'rails_helper'

RSpec.describe "API request" do
  it "can get a successful JSON response of all merchants" do
    

    visit '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    expect(merchants["data"].count).to eq(5)
  end
end
