class RecipeService

  def self.get_recipes(country)
    response = conn.get("/api/recipes/v2") do |request|
      request.params['q'] = country
    end
    parse(response.body)
  end

  private

  def self.conn 
    Faraday.new('https://api.edamam.com') do |f|
      f.params['app_id'] = ENV['recipe_api_id']
      f.params['app_key'] = ENV['recipe_api_key']
      f.params['type'] = 'public'
    end
  end

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end