class Api::V1::LearningResourcesController < ApplicationController
  def index
    country = country_params[:country]
    video = VideoFacade.find_country_video(country)
    images = ImageFacade.find_country_images(country)
    learning = LearningResource.new(country, video, images)
    render json: LearningSerializer.new(learning)
  end

  private

  def country_params
    params.permit(:country)
  end
end
