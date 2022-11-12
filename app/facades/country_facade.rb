class CountryFacade
  def self.find_random_country
    countries = find_all_countries
    countries.sample
  end

  # TODO: cache method so that we can utilize same array multiple times in same session
  def self.find_all_countries
    country_data = CountryService.get_countries
    countries = country_data.map do |country|
      country[:name][:common]
    end
  end
end
