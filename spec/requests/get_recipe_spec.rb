require 'rails_helper'

RSpec.describe 'Get recipe', vcr: {record: :new_episodes} do
  it 'retrieves recipes for a given country' do
    country = ("thailand")

    get "/api/v1/recipes?country=#{country}"
    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(recipes).to be_a Hash
    expect(recipes.keys).to eq([:data])
    expect(recipes[:data]).to be_an Array
    recipes[:data].each do |recipe|
      expect(recipe.keys).to eq([:id, :type, :attributes])
      expect(recipe[:id]).to eq(nil)
      expect(recipe[:type]).to eq("recipe")
      expect(recipe[:attributes]).to be_a Hash
      expect(recipe[:attributes][:country]).to eq("thailand")
    end
  end

  it "does not return unnecessary data" do
    country = ("canada")

    get "/api/v1/recipes?country=#{country}"
    recipes = JSON.parse(response.body, symbolize_names: true)

    recipes[:data].each do |recipe|
      expect(recipe).to_not have_key(:label)
      expect(recipe).to_not have_key(:yield)
      expect(recipe).to_not have_key(:dietLabels)
      expect(recipe).to_not have_key(:source)
    end
  end

  it 'retrieves recipes for a random country' do
    country = ("random")

    get "/api/v1/recipes?country=#{country}"
    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful

    expect(recipes).to be_a Hash
    expect(recipes.keys).to eq([:data])
    expect(recipes[:data]).to be_an Array
    recipes[:data].each do |recipe|
      expect(recipe.keys).to eq([:id, :type, :attributes])
      expect(recipe[:id]).to eq(nil)
      expect(recipe[:type]).to eq("recipe")
      expect(recipe[:attributes]).to be_a Hash
      expect(recipe[:attributes][:country]).to be_a String
    end
  end

  it 'returns empty data for empty search field' do
    country = ("")

    get "/api/v1/recipes?country=#{country}"
    recipes = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(recipes.keys).to eq([:data])
    expect(recipes[:data]).to be_an Array
    expect(recipes[:data].count).to eq 0
  end
end
