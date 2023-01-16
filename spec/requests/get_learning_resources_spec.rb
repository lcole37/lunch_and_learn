require 'rails_helper'

RSpec.describe 'Get recipe', vcr: {record: :new_episodes} do
  it 'retrieves learning resources for a given country' do
    country = ("thailand")

    get "/api/v1/learning_resources?country=#{country}"

    expect(response).to be_successful
  end
end
