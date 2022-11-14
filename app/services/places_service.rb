class PlacesService
  def self.get_tourist_sights(lat, lng)
    response = conn.get('/v2/places') do |request|
      request.params['categories'] = 'tourism.sights'
      request.params['filter'] = "circle:#{lng},#{lat},20000"
    end
    parse(response.body)
  end

  def self.conn
    Faraday.new('https://api.geoapify.com') do |f|
      f.params['apiKey'] = ENV['places_api_key']
    end
  end

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end