class Api::V1::TouristSightsController < ApplicationController 
  def index
    country = country_params[:country]
    location = CountryFacade.find_country_location(country)
    sights = PlacesFacade.find_tourist_sights(location[:lat],location[:lng])
    render json: TouristSightSerializer.new(sights)
  end

  private

  def country_params
    params.permit(:country)
  end
end