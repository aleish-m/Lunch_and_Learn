class Recipe
  attr_reader :title, :image, :country, :url

  def initialize(recipe_data, country)
    @title = recipe_data[:recipe][:lable]
    @url = recipe_data[:recipe][:uri]
    @image = recipe_data[:recipe][:image]
    @country = country.downcase
  end
end