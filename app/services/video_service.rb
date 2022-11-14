class VideoService
  def self.get_country_video(country)
    response = conn.get('/youtube/v3/search') do |request|
      request.params['channelId'] = ENV['mr_history_id']
      request.params['q'] = country
    end
    parse(response.body)
  end

  def self.conn
    Faraday.new('https://www.googleapis.com') do |f|
      f.params['key'] = ENV['youtube_api_key']
      f.params['part'] = 'snippet'
    end
  end

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
