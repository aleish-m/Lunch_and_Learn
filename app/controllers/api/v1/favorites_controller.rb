class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(user_params)
    favorite = Favorite.new(favorites_params)
    user.favorites << favorite
    render json: {success: "Favorite added successfully"}, status: :created
  end

  private

  def user_params
    params.permit(:api_key)
  end

  def favorites_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end