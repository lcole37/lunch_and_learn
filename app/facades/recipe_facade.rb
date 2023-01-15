class RecipeFacade
  def self.recipes_from_random_country
    country = CountryService.get_random_country
    @recipes = RecipeService.get_recipe_by_country(@country = country)
    recipe_details
  end

  def self.recipes_from_country(searched_country)
    @recipes = RecipeService.get_recipe_by_country(@country = searched_country)
    recipe_details
  end

  def self.recipe_details
    @recipes.map do |recipe|
      Recipe.new(data = {title: recipe[:recipe][:label], url: recipe[:recipe][:uri], country: @country, image: recipe[:recipe][:image]})
    end
  end
end
