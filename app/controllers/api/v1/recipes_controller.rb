class Api::V1::RecipesController < ApplicationController
  def index
    country = country_params[:country]
    recipes = RecipeFacade.find_recipes(country)
    render json: RecipeSerializer.new(recipes)
  end

  private 

  def country_params
    params.permit(:country)
  end
end
