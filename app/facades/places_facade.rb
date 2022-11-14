class PlacesFacade
  def self.find_tourist_sights(lat, lng)
    sights_data = PlacesService.get_tourist_sights(lat, lng)
    sights_data[:features].map do |sight_data|
      Sight.new(sight_data)
    end
  end
end