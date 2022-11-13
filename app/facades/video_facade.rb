class VideoFacade
  def self.find_country_video(country)
    videos_data = VideoService.get_country_video(country)
    first_video_data = videos_data[:items][0]
    Video.new(first_video_data)
  end
end
