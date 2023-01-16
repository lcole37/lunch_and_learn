require 'rails_helper'

RSpec.describe RecipeFacade, vcr: {record: :new_episodes} do
  it "returns recipes from random country" do
    recipes = RecipeFacade.recipes_from_random_country

    expect(recipes).to be_an Array
    recipes.each do |recipe|
      expect(recipe).to be_a Recipe
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
