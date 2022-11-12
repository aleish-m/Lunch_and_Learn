require 'rails_helper'

RSpec.describe CountryService do
  describe 'get country API endpoints' do
    it 'can get all countries', :vcr do
      country_data = CountryService.get_countries

      expect(country_data).to be_an(Array)

      country_data.each do |country|
        expect(country).to be_a(Hash)

        expect(country).to have_key(:name)
        expect(country[:name]).to be_a(Hash)
        expect(country[:name]).to have_key(:common)
        expect(country[:name][:common]).to be_a(String)
        expect(country[:name]).to have_key(:official)
        expect(country[:name][:official]).to be_a(String)

        expect(country).to have_key(:region)
        expect(country[:region]).to be_a(String)

        expect(country).to have_key(:area)
        expect(country[:area]).to be_a(Numeric)

        expect(country).to have_key(:population)
        expect(country[:population]).to be_a(Integer)

      end
    end
  end
end
