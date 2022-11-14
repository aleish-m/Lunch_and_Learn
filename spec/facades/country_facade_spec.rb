require 'rails_helper'

RSpec.describe CountryFacade do
  describe 'class methods' do
    describe '#find_all_countries' do
      it 'can find a list of country names from a response with several pieces data for multiple countries' do
        VCR.use_cassette('find_all_countries') do
          countries = CountryFacade.find_all_countries

          expect(countries).to be_an(Array)
          expect(countries).to include('China')
          expect(countries).to include('Mauritania')
          expect(countries).to_not include('Islamic Republic of Mauritania')
          expect(countries).to_not include('Islamic Republic of Mauritania')
          expect(countries).to_not include('Africa')

          countries.each do |country|
            expect(country).to be_a(String)
          end
        end
      end
    end

    describe '#find_random_country' do
      it 'can find a one random country name from a list of multiple country names' do
        VCR.use_cassette('find_all_countries', allow_playback_repeats: true) do
          country = CountryFacade.find_random_country

          expect(country).to be_a(String)
          expect(CountryFacade.find_all_countries).to include(country)
        end
      end
    end

    describe '#find_country_location' do
      it 'can find the latitude and longitude location for a provided country', :vcr do
        location = CountryFacade.find_country_location('Latvia')

        expect(location).to be_a(Hash)
        expect(location.count).to eq(2)
        expect(location).to have_key(:lat)
        expect(location).to have_key(:lng)
        expect(location[:lat]).to be_a(Numeric)
        expect(location[:lng]).to be_a(Numeric)

        expect(location).to_not have_key(:name)
        expect(location).to_not have_key(:currencies)
        expect(location).to_not have_key(:capital)
        expect(location).to_not have_key(:population)
      end

      it 'can find the latitude and longitude location for a provided country when country name is multiple words', :vcr do
        location = CountryFacade.find_country_location('New Zealand')

        expect(location).to be_a(Hash)
        expect(location.count).to eq(2)
        expect(location).to have_key(:lat)
        expect(location).to have_key(:lng)
        expect(location[:lat]).to be_a(Numeric)
        expect(location[:lng]).to be_a(Numeric)

        expect(location).to_not have_key(:name)
        expect(location).to_not have_key(:currencies)
        expect(location).to_not have_key(:capital)
        expect(location).to_not have_key(:population)
      end
    end
  end
end
