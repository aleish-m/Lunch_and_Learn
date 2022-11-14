require 'rails_helper'

describe 'Find Tourist Sights API' do
  describe 'find tourist sights for a country' do
    describe 'happy path' do
      it 'can find tourist sights near a given countrys capital city', :vcr do
        request_params = { country: 'France' }

        get '/api/v1/tourist_sights', params: request_params

        expect(response).to be_successful

        sights_response = JSON.parse(response.body, symbolize_names: true)
        sights_data = sights_response[:data]

        expect(sights_response).to be_a(Hash)
        expect(sights_response.count).to eq(1)

        expect(sights_response).to be_a(Hash)
        expect(sights_response.count).to eq(1)

        expect(sights_data).to be_an(Array)
        expect(sights_data).to_not be_empty

        sights_data.each do |sight|
          expect(sight.count).to eq(3)
          expect(sight[:id]).to be(nil)
          expect(sight[:type]).to eq("tourist_sight")
          expect(sight[:attributes]).to be_a(Hash)
          expect(sight[:attributes].count).to eq(3)
          expect(sight[:attributes][:name]).to be_a(String)
          expect(sight[:attributes][:address]).to be_a(String)
          expect(sight[:attributes][:place_id]).to be_a(String)
        end
      end
    end
  end
end