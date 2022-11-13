class ImageService
  def self.get_images_for_country(country)
    response = conn.get('/search/photos') do |request|
      request.params['query'] = country
    end
    parse(response.body)
  end

  def self.conn
    Faraday.new('https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['unsplash_api_key']
    end
  end

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
