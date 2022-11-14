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

      it 'can find tourist sights near a given multi-word countrys capital city', :vcr do
        request_params = { country: 'New Zealand' }

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

        expect(sights_data[0].count).to eq(3)
        expect(sights_data[0][:id]).to be(nil)
        expect(sights_data[0][:type]).to eq("tourist_sight")
        expect(sights_data[0][:attributes]).to be_a(Hash)
        expect(sights_data[0][:attributes].count).to eq(3)
        expect(sights_data[0][:attributes][:name]).to be_a(String)
        expect(sights_data[0][:attributes][:address]).to be_a(String)
        expect(sights_data[0][:attributes][:place_id]).to be_a(String)
      end

      it 'if a name for the tourist sight it returns a nil value', :vcr do
        request_params = { country: 'New Zealand' }

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

        expect(sights_data[1].count).to eq(3)
        expect(sights_data[1][:id]).to be(nil)
        expect(sights_data[1][:type]).to eq("tourist_sight")
        expect(sights_data[1][:attributes]).to be_a(Hash)
        expect(sights_data[1][:attributes].count).to eq(3)
        expect(sights_data[1][:attributes][:name]).to be(nil)
        expect(sights_data[1][:attributes][:address]).to be_a(String)
        expect(sights_data[1][:attributes][:place_id]).to be_a(String)
      end
    end

    it 'can find tourist sights near a given countrys capital city even if only a partial name received', :vcr do
        request_params = { country: 'zealand' }

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

        expect(sights_data[0].count).to eq(3)
        expect(sights_data[0][:id]).to be(nil)
        expect(sights_data[0][:type]).to eq("tourist_sight")
        expect(sights_data[0][:attributes]).to be_a(Hash)
        expect(sights_data[0][:attributes].count).to eq(3)
        expect(sights_data[0][:attributes][:name]).to be_a(String)
        expect(sights_data[0][:attributes][:address]).to be_a(String)
        expect(sights_data[0][:attributes][:place_id]).to be_a(String)
      end

    it 'returns a empty arry if no sights are found', :vcr do
      request_params = { country: 'fran' }

      get '/api/v1/tourist_sights', params: request_params

      expect(response).to be_successful

      sights_response = JSON.parse(response.body, symbolize_names: true)
      sights_data = sights_response[:data]

      expect(sights_response).to be_a(Hash)
      expect(sights_response.count).to eq(1)

      expect(sights_response[:data]).to be_an(Array)
      expect(sights_response[:data]).to be_empty

      expect(sights_response).to eq({data:[ ]})
       
    end
  end
end