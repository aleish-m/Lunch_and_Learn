class VideoFacade
  def self.find_country_video(country)
    videos_data = VideoService.get_country_video(country)
    first_video_data = videos_data[:items][0]
    if first_video_data.present?
      Video.new(first_video_data)
    else
      []
    end
  end
end
