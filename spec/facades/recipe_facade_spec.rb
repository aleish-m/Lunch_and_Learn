require 'rails_helper'

RSpec.describe RecipeFacade do
  describe 'class methods' do
    describe '#find_recipes' do
      it 'can find a list of up to 20 recipes that are for the specified country', :vcr do
        country = "Italy"
        recipes_info = RecipeFacade.find_recipes(country)

        expect(recipes_info).to be_an(Array)
        expect(recipes_info.count).to eq(20)

        recipes_info.each do |recipe_info|
          expect(recipe_info).to be_a(Recipe)
        end

        expect(recipes_info).to_not include(source: "Food52")
        expect(recipes_info).to_not include("Food52")
        expect(recipes_info).to_not include(yield: 2.0)
        expect(recipes_info).to_not include(2.0)
      end
    end
  end
end