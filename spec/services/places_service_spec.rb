require 'rails_helper'

RSpec.describe PlacesService do
  describe 'get tourist sights API endpoint' do
    it 'can get all tourist sights for a given country', :vcr do
      tourist_sights_data = PlacesService.get_tourist_sights(25.0, 57.0)

      expect(tourist_sights_data).to be_a(Hash)
      expect(tourist_sights_data).to have_key(:features)
      expect(tourist_sights_data[:features]).to be_an(Array)

      tourist_sights_data[:features].each do |tourist_sight|
        expect(tourist_sight).to be_a(Hash)

        expect(tourist_sight).to have_key(:type)
        expect(tourist_sight[:type]).to be_a(String)

        expect(tourist_sight).to have_key(:properties)
        expect(tourist_sight[:properties]).to be_a(Hash)

        expect(tourist_sight[:properties]).to have_key(:name)
        expect(tourist_sight[:properties][:name]).to be_a(String)

        expect(tourist_sight[:properties]).to have_key(:address_line2)
        expect(tourist_sight[:properties][:address_line2]).to be_a(String)

        expect(tourist_sight[:properties]).to have_key(:formatted)
        expect(tourist_sight[:properties][:formatted]).to be_a(String)

        expect(tourist_sight[:properties]).to have_key(:categories)
        expect(tourist_sight[:properties][:categories]).to be_an(Array)

        expect(tourist_sight[:properties]).to have_key(:place_id)
        expect(tourist_sight[:properties][:place_id]).to be_a(String)

        expect(tourist_sight[:properties]).to have_key(:datasource)
        expect(tourist_sight[:properties][:datasource]).to be_a(Hash)

        expect(tourist_sight).to have_key(:geometry)
        expect(tourist_sight[:geometry]).to be_a(Hash)
      end
    end
  end
end
