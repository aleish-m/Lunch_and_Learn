class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(user_params)
    # require "pry"; binding.pry
    favorite = Favorite.new(favorites_params)
  end

  private

  def user_params
    params.permit(:api_key)
  end

  def favorites_params
    params.permit(:country, :recipe_link, :recipe_title, )
  end
end