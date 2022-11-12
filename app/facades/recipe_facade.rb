class RecipeFacade

  def self.find_recipes(country)
    recipes_data = RecipeService.get_recipes(country)
    recipes_data[:hits].each do |recipe|
      Recipe.new(recipe, country)
    end
  end
end