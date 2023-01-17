class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country] == "random" #FE button needs to link to '..?coutry=random'
      country = CountryService.get_random_country
      recipes = RecipeFacade.recipes_from_country(country)
      render json: RecipeSerializer.new(recipes)
    elsif params[:country] == ""
      render json: ({"data": [] #need a method here...
                    })
    else
      country = params[:country]
      recipes = RecipeFacade.recipes_from_country(country)
      render json: RecipeSerializer.new(recipes)
    end
  end
end
