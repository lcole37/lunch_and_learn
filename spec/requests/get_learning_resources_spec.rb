require 'rails_helper'

RSpec.describe 'Get recipe', vcr: {record: :new_episodes} do
  describe "happy path" do
    it 'retrieves learning resources for a given country' do
      country = ("thailand")

      get "/api/v1/learning_resources?country=#{country}"
      parsed = JSON.parse(response.body, symbolize_names: true)
      # require "pry"; binding.pry
      expect(response).to be_successful
      expect((parsed[:data]).keys).to eq([:id, :type, :attributes])
      expect((parsed[:data][:attributes]).keys).to eq([:country, :video, :images])
      expect(parsed[:data][:attributes][:images]).to be_an Array
      expect(parsed[:data][:attributes][:images][0][:alt_tag]).to be_a String
      expect(parsed[:data][:attributes][:images][0][:url]).to be_a String
      expect(parsed[:data][:attributes][:video]).to be_a Hash
      expect(parsed[:data][:attributes][:video][:title]).to be_a String
      expect(parsed[:data][:attributes][:video][:youtube_video_id]).to be_a String
    end
  end
end
