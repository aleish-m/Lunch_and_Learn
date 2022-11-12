class Api::V1::RecipesController < ApplicationController
  def index
    country = find_country
    recipes = RecipeFacade.find_recipes(country)
    render json: RecipeSerializer.new(recipes)
  end

  private

  def country_params
    params.permit(:country)
  end

  def find_country
    if country_params.present?
      country_params[:country]
    else
      CountryFacade.find_random_country
    end
  end
end
