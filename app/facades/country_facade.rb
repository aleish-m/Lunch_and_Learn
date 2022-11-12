class CountryFacade

  #TODO: cache method so that we can utilize same array multiple times in same session
  def self.find_random_country
    country_data = CountryService.get_countries
    countries = country_data.map do |country|
      country[:name][:common]
    end
    countries.sample
  end
end