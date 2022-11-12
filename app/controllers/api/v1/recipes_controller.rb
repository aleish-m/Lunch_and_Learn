class Api::V1::RecipesController < ApplicationController
  def index
    if country_params.present?
      country = country_params[:country]
    else
      country = CountryFacade.find_random_country
    end
    recipes = RecipeFacade.find_recipes(country)
    render json: RecipeSerializer.new(recipes)
  end

  private

  def country_params
    params.permit(:country)
  end
end
