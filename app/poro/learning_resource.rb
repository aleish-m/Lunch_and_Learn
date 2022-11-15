class LearningResource
  attr_reader :country, :video, :images

  def initialize(video, images, country)
    @country = country
    @video = video
    @images = images
  end
end
