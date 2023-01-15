class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country]
      country = params[:country]
    else
      country = CountryService.get_random_country
    end
    recipes = RecipeFacade.recipes_from_country(country)
    render json: RecipeSerializer.new(recipes)
  end

end
