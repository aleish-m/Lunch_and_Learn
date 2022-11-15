require 'rails_helper'

describe 'Favorites Endpoints' do
  describe 'Add Favorite recipe for a user to the favorites database' do
    describe 'happy path' do
      it 'a user can favorite a recipe and have it saved in teh database' do
        user = create(:user)
        request_headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }
        request_params = JSON.generate({ api_key: user.api_key, 
                            country: 'new zealand',
                            recipe_link: 'http://www.marthastewart.com/355892/linguine-new-zealand-cockles',
                            recipe_title: 'Linguine with New Zealand Cockles recipes'
                          })

        post '/api/v1/favorites', headers: request_headers, params: request_params

        expect(response).to have_http_status(201)

        favorites_response = JSON.parse(response.body, symbolize_names: true)

        expect(favorites_response).to be_a(Hash)
        expect(favorites_response.count).to eq(1)
        expect(favorites_response).to eq({success: "Favorite added successfully"})

        expect(user.favorites.first.recipe_title).to eq("Linguine with New Zealand Cockles recipes")
      end
    end

    describe 'sad path' do
      it 'if no matching user Api key is found in the database the favorite is not saved and an error message is returned' do
        user = create(:user)
        request_headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }
        request_params = JSON.generate({ api_key: 'JJ-3dc0vW5if5w8PBdFqvg', 
                            country: 'new zealand',
                            recipe_link: 'http://www.marthastewart.com/355892/linguine-new-zealand-cockles',
                            recipe_title: 'Linguine with New Zealand Cockles recipes'
                          })

        post '/api/v1/favorites', headers: request_headers, params: request_params

        expect(response).to have_http_status(404)

        favorites_response = JSON.parse(response.body, symbolize_names: true)

        expect(favorites_response).to be_a(Hash)
        expect(favorites_response.count).to eq(2)

        expect(favorites_response).to have_key(:error)
        expect(favorites_response[:error]).to eq(404)
        expect(favorites_response).to have_key(:message)
        expect(favorites_response[:message]).to be_a(String)
        expect(favorites_response).to eq({error: 404, message: 'Invalid user api key'})

        expect(user.favorites.first).to eq(nil)
      end

      it 'if a piece of info for a favorite is missing favorite is not saved and an error message is returned' do
        user = create(:user)
        request_headers = { CONTENT_TYPE: 'application/json', Accept: 'application/json' }
        request_params = JSON.generate({ api_key: user.api_key, 
                            country: 'new zealand',
                            recipe_title: 'Linguine with New Zealand Cockles recipes'
                          })

        post '/api/v1/favorites', headers: request_headers, params: request_params

        expect(response).to have_http_status(400)

        favorites_response = JSON.parse(response.body, symbolize_names: true)

        expect(favorites_response).to be_a(Hash)
        expect(favorites_response.count).to eq(2)

        expect(favorites_response).to have_key(:error)
        expect(favorites_response[:error]).to eq(400)
        expect(favorites_response).to have_key(:message)
        expect(favorites_response[:message]).to be_a(String)
        expect(favorites_response).to eq({error: 400, message: "Recipe link can't be blank"})

        expect(user.favorites.first).to eq(nil)
      end
    end
  end

  describe 'Get all saved favorites for a user' do
    describe 'happy path' do
      it 'can return all of a users favorites when the users api-key is provided' do
        user = create(:user)
        request_params = { api_key: user.api_key}

        get '/api/v1/favorites', params: request_params

        expect(response).to be_successful

        favorites_response = JSON.parse(response.body, symbolize_names: true)

        expect(favorites_response).to be_a(Hash)
        expect(favorites_response.count).to eq(1)
      end
    end
  end
end
