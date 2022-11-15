class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(user_params)
    favorite = Favorite.new(favorites_params)
    if user.present?
      user.favorites << favorite
      if favorite.save
        render json: {success: "Favorite added successfully"}, status: :created
      else
        render json: {error: 400, message: favorite.errors.full_messages.to_sentence }, status: :bad_request
      end
    else
      render json: {error: 404, message: 'Invalid user api key'}, status: :not_found
    end

  end

  private

  def user_params
    params.permit(:api_key)
  end

  def favorites_params
    params.require(:favorite).permit(:country, :recipe_link, :recipe_title)
  end
end