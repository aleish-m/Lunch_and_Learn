class Recipe
  attr_reader :title, :image, :country, :url

  def initialize(recipe_data, country)
    @title = recipe_data[:recipe][:label]
    @url = recipe_data[:recipe][:url]
    @image = recipe_data[:recipe][:image]
    @country = country.downcase
  end
end