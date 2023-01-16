require 'rails_helper'

RSpec.describe 'Get recipe', vcr: {record: :new_episodes} do
  it 'retrieves recipes for a given country' do
    country = ("thailand")

    get "/api/v1/recipes?country=#{country}"
    
    expect(response).to be_successful
  end

  it 'retrieves recipes for a given country' do
    country = ("random")

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
  end

  it 'returns empty data for empty search field' do
    country = ("")

    get "/api/v1/recipes?country=#{country}"

    expect(response).to be_successful
  end
end
