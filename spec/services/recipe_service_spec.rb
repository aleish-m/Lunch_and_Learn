require 'rails_helper'

RSpec.describe RecipeService do
  describe 'get recipe API endpoint' do
    it 'can get recipes for a country', :vcr do
      country = "Italy"
      recipe_data = RecipeService.get_recipes(country)

      expect(recipe_data).to be_a(Hash)
      expect(recipe_data).to have_key(:hits)
      expect(recipe_data[:hits]).to be_an(Array)

      recipe_data[:hits].each do |recipe|
        expect(recipe).to be_a(Hash)

        expect(recipe).to have_key(:recipe)
        expect(recipe[:recipe]).to be_a(Hash)

        expect(recipe[:recipe]).to have_key(:uri)
        expect(recipe[:recipe][:uri]).to be_a(String)

        expect(recipe[:recipe]).to have_key(:label)
        expect(recipe[:recipe][:label]).to be_a(String)

        expect(recipe[:recipe]).to have_key(:image)
        expect(recipe[:recipe][:image]).to be_a(String)

        expect(recipe[:recipe]).to have_key(:images)
        expect(recipe[:recipe][:images]).to be_a(Hash)

        expect(recipe[:recipe]).to have_key(:source)
        expect(recipe[:recipe][:source]).to be_a(String)

        expect(recipe[:recipe]).to have_key(:url)
        expect(recipe[:recipe][:url]).to be_a(String)

        expect(recipe[:recipe]).to have_key(:yield)
        expect(recipe[:recipe][:yield]).to be_a(Numeric)

        expect(recipe[:recipe]).to have_key(:calories)
        expect(recipe[:recipe][:calories]).to be_a(Numeric)

        expect(recipe[:recipe]).to have_key(:totalTime)
        expect(recipe[:recipe][:totalTime]).to be_a(Numeric)

        expect(recipe[:recipe]).to have_key(:cuisineType)
        expect(recipe[:recipe][:cuisineType]).to be_an(Array)

        expect(recipe[:recipe]).to have_key(:mealType)
        expect(recipe[:recipe][:mealType]).to be_an(Array)

      end
    end
  end
end