require 'rails_helper'

describe 'Find Recipes API' do
  describe 'find recipes for a country' do
    describe 'happy path' do
      it 'can find recipes for a country when country param is sent in by user', :vcr do
        request_params = { country: 'thailand' }

        get '/api/v1/recipes', params: request_params

        expect(response).to be_successful

        recipe_response = JSON.parse(response.body, symbolize_names: true)
        recipe_data = recipe_response[:data]

        expect(recipe_response).to be_a(Hash)
        expect(recipe_response.count).to eq(1)

        expect(recipe_data).to be_an(Array)
        expect(recipe_data).to_not be_empty

        recipe_data.each do |recipe|
          expect(recipe.count).to eq(3)
          expect(recipe[:id]).to be(nil)
          expect(recipe[:type]).to be_a(String)
          expect(recipe[:attributes]).to be_a(Hash)
          expect(recipe[:attributes].count).to eq(4)
          expect(recipe[:attributes][:title]).to be_a(String)
          expect(recipe[:attributes][:url]).to be_a(String)
          expect(recipe[:attributes][:country]).to be_a(String)
          expect(recipe[:attributes][:image]).to be_a(String)
        end
      end

      it 'can find recipes for a random country if no country is sent in by user', :vcr do
        allow(CountryFacade).to receive(:find_random_country).and_return('Algeria')

        get '/api/v1/recipes'

        expect(response).to be_successful

        recipe_response = JSON.parse(response.body, symbolize_names: true)
        recipe_data = recipe_response[:data]
        expect(recipe_response).to be_a(Hash)
        expect(recipe_response.count).to eq(1)

        expect(recipe_data).to be_an(Array)
        expect(recipe_data).to_not be_empty

        recipe_data.each do |recipe|
          expect(recipe.count).to eq(3)
          expect(recipe[:id]).to be(nil)
          expect(recipe[:type]).to be_a(String)
          expect(recipe[:attributes]).to be_a(Hash)
          expect(recipe[:attributes].count).to eq(4)
          expect(recipe[:attributes][:title]).to be_a(String)
          expect(recipe[:attributes][:url]).to be_a(String)
          expect(recipe[:attributes][:country]).to be_a(String)
          expect(recipe[:attributes][:image]).to be_a(String)
        end
      end
    end

    describe 'sad_path' do
      it 'returns an empty array with a successful status if country has no results', :vcr do
        request_params = { country: 'Aland Islands' }

        get '/api/v1/recipes', params: request_params

        expect(response).to be_successful

        recipe_response = JSON.parse(response.body, symbolize_names: true)
        recipe_data = recipe_response[:data]

        expect(recipe_response).to be_a(Hash)
        expect(recipe_response.count).to eq(1)

        expect(recipe_data).to be_an(Array)
        expect(recipe_data).to be_empty

        expect(recipe_response).to eq({data:[ ]})
      end

      it 'returns an empty array with a successful status if user send an empty string for country', :vcr do
        request_params = { country: ' ' }

        get '/api/v1/recipes', params: request_params

        expect(response).to be_successful

        recipe_response = JSON.parse(response.body, symbolize_names: true)
        recipe_data = recipe_response[:data]

        expect(recipe_response).to be_a(Hash)
        expect(recipe_response.count).to eq(1)

        expect(recipe_data).to be_an(Array)
        expect(recipe_data).to be_empty

        expect(recipe_response).to eq({data:[ ]})
      end
    end
  end
end
