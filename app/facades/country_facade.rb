class CountryFacade

  def self.find_random_country
    country_data = CountryService.get_countries
    countries = country_data.map do |country|
      country[:name][:common]
    end
    # require "pry"; binding.pry
    countries.sample
  end
end