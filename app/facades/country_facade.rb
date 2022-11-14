class CountryFacade
  def self.find_random_country
    countries = find_all_countries
    countries.sample
  end

  def self.find_all_countries
    country_data = CountryService.get_countries
    countries = country_data.map do |country|
      country[:name][:common]
    end
  end

  def self.find_country_location(country)
    country_data = CountryService.get_info_for_country(country)
    location = country_data[0][:latlng]
    {lat:location[0], lng:location[1]}
  end
end
