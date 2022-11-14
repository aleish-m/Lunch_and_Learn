class CountryService
  def self.get_countries
    response = conn.get('/v3.1/all')
    parse(response.body)
  end

  def self.get_info_for_country(country)
    response = conn.get("/v3.1/name/#{country.gsub(' ','%20')}")
    parse(response.body)
  end

  private

  def self.conn
    Faraday.new('https://restcountries.com')
  end

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
