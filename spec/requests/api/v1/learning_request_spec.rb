require 'rails_helper'

describe 'Find Learning resources API' do
  describe 'find learning resources for a country' do
    describe 'happy path' do
      it 'can find images and videos for a country', :vcr do
        request_params = { country: 'thailand' }

        get '/api/v1/learning_resources', params: request_params

        expect(response).to be_successful

        learning_response = JSON.parse(response.body, symbolize_names: true)
        learning_data = learning_response[:data]
        learning_attributes = learning_response[:data][:attributes]

        expect(learning_response).to be_a(Hash)
        expect(learning_response.count).to eq(1)

        expect(learning_data).to be_a(Hash)
        expect(learning_data.count).to eq(3)

        expect(learning_data).to have_key(:id)
        expect(learning_data[:id]).to be(nil)
        expect(learning_data).to have_key(:type)
        expect(learning_data[:type]).to be_a(String)
        expect(learning_data).to have_key(:attributes)
        expect(learning_data[:attributes]).to be_a(Hash)
        expect(learning_data[:attributes].count).to eq(3)

        expect(learning_attributes).to have_key(:country)
        expect(learning_attributes[:country]).to be_a(String)

        expect(learning_attributes).to have_key(:video)
        expect(learning_attributes[:video]).to be_a(Hash)
        expect(learning_attributes[:video].count).to eq(2)
        expect(learning_attributes[:video]).to have_key(:title)
        expect(learning_attributes[:video][:title]).to be_a(String)
        expect(learning_attributes[:video]).to have_key(:youtube_video_id)
        expect(learning_attributes[:video][:youtube_video_id]).to be_a(String)

        expect(learning_attributes[:video]).to_not have_key(:channelTitle)
        expect(learning_attributes[:video]).to_not have_key(:description)
        expect(learning_attributes[:video]).to_not have_key(:kind)

        expect(learning_attributes).to have_key(:images)
        expect(learning_attributes[:images]).to be_an(Array)

        learning_attributes[:images].each do |image|
          expect(image.count).to eq(2)
          expect(image).to have_key(:alt_tag)
          expect(image[:alt_tag]).to be_a(String)
          expect(image).to have_key(:url)
          expect(image[:url]).to be_a(String)

          expect(image).to_not have_key(:description)
          expect(image).to_not have_key(:id)
          expect(image).to_not have_key(:user)
        end
      end
    end
  end
end
