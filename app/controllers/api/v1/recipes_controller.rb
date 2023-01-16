class Api::V1::RecipesController < ApplicationController
  def index
    # require "pry"; binding.pry
    if params[:country] == "random" #button needs to link to '..?coutry=random'
      # require "pry"; binding.pry
      country = CountryService.get_random_country
      recipes = RecipeFacade.recipes_from_country(country)
      render json: RecipeSerializer.new(recipes)
    elsif params[:country] == ""
      render json: ({"data": [] #need a method here no hard code
                    })
    else
      country = params[:country]
      recipes = RecipeFacade.recipes_from_country(country)
      render json: RecipeSerializer.new(recipes)
    end
  end
end
