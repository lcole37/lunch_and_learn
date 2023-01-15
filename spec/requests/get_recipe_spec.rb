require 'rails_helper'

RSpec.describe 'Get recipe', :vcr do
  it 'retrieves recipes for a given country' do
    country = ("thailand")

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
  end
end
