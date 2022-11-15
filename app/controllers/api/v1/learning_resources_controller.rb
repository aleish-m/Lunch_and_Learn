class Api::V1::LearningResourcesController < ApplicationController
  def index
    country = country_params[:country]
    if country.present?
      video = VideoFacade.find_country_video(country)
      images = ImageFacade.find_country_images(country)
      learning = LearningResource.new(video, images, country)
      render json: LearningSerializer.new(learning)
    else
      learning = LearningResource.new([], [], nil)
      render json: LearningSerializer.new(learning)
    end
  end

  private

  def country_params
    params.permit(:country)
  end
end
