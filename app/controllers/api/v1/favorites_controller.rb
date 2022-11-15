class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(user_params)
    favorites = user.favorites
    render json: FavoriteSerializer.new(favorites)
  end
  
  def create
    user = User.find_by(user_params)
    favorite = Favorite.new(favorites_params)
    if user.present?
      favorite.user = user
      validate_user_favorite(favorite)
    else
      render json: FavoriteSerializer.error(404, 'Invalid user api key'), status: :not_found
    end

  end

  private

  def user_params
    params.permit(:api_key)
  end

  def favorites_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end

  def validate_user_favorite(favorite)
    if favorite.save
        render json: FavoriteSerializer.success, status: :created
      else
        render json: FavoriteSerializer.error(400, favorite.errors.full_messages.to_sentence), status: :bad_request
      end
  end
end