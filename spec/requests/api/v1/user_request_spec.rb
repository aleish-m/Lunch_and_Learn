require 'rails_helper'

describe 'Users Endpoints' do
  describe 'Add a User to user database' do
    describe 'happy path' do
      it 'add a new user to the user database and returns the user object once created' do
        request_headers = {CONTENT_TYPE: "application/json", Accept: "application/json"}
        request_params = '{ "name": "Athena Dao",
                         "email": "athenadao@bestgirlever.com" }'

        post '/api/v1/users', headers: request_headers, params: request_params

        expect(response).to have_http_status(201)

        user_response = JSON.parse(response.body, symbolize_names: true)
        user_data = user_response[:data]

        expect(user_response).to be_a(Hash)
        expect(user_response.count).to eq(1)

        expect(user_data).to be_a(Hash)
        expect(user_data.count).to eq(3)

        expect(user_data).to have_key(:id)
        expect(user_data[:id]).to be_a(String)
        expect(user_data).to have_key(:type)
        expect(user_data[:type]).to eq('user')
        expect(user_data).to have_key(:attributes)
        expect(user_data[:attributes]).to be_a(Hash)
        expect(user_data[:attributes]).to have_key(:name)
        expect(user_data[:attributes][:name]).to eq('Athena Dao')
        expect(user_data[:attributes]).to have_key(:email)
        expect(user_data[:attributes][:email]).to eq('athenadao@bestgirlever.com')
        expect(user_data[:attributes]).to have_key(:api_key)
        expect(user_data[:attributes][:api_key]).to be_a(String)
      end
    end

    describe 'sad path' do
      it 'add a new user to the user database and returns the user object once created' do
        user = User.create!(name: 'Athena', email:  'athenadao@bestgirlever.com')

        request_headers = {CONTENT_TYPE: "application/json", Accept: "application/json"}
        request_params = '{ "name": "Athena Dao",
                         "email": "athenadao@bestgirlever.com" }'

        post '/api/v1/users', headers: request_headers, params: request_params

        expect(response).to have_http_status(400)

        user_response = JSON.parse(response.body, symbolize_names: true)

        expect(user_response).to be_a(Hash)
        expect(user_response.count).to eq(2)

        expect(user_response).to have_key(:error)
        expect(user_response[:error]).to eq(400)
        expect(user_response).to have_key(:message)
        expect(user_response[:message]).to be_a(String)
        expect(user_response).to eq({error: 400, message: 'Email has already been taken'})
      end
    end
  end
end
