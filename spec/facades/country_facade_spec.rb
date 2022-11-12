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
  end
end
