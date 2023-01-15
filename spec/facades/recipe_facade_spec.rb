require 'rails_helper'

RSpec.describe RecipeFacade, :vcr do
  xit "returns recipes from random country" do
    recipes = RecipeFacade.recipes_from_random_country

    expect(recipes).to be_an Array
    recipes.each do |recipe|
      expect(recipe[:id]).to be_nil
      expect(recipe[:type]).to be_nil
      expect(recipe[:attributes]).to be_a Hash
      expect(recipe[:attributes].keys).to eq([:title, :url, :country, :image])
      expect(recipe[:attributes][:title]).to be_a String
      expect(recipe[:attributes][:url]).to be_a String
      expect(recipe[:attributes][:country]).to be_a String
      expect(recipe[:attributes][:image]).to be_a String
    end
  end

  it "can get recipes from searched country" do
    recipes = RecipeFacade.recipes_from_country('thailand')

    expect(recipes).to be_an Array
    expect(recipes.count).to eq 10
    recipes.each do |recipe|
      expect(recipe).to be_a Recipe
    end
  end
end
