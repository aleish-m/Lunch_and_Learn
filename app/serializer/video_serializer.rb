class VideoSerializer
  def self.video_info(video)
    {
      title: video.title,
      youtube_video_id: video.youtube_video_id
    }
  end
end
