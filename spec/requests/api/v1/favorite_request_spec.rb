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

        expect(user.favorites.first.recipe_title).to be("Linguine with New Zealand Cockles recipes")
      end
    end
  end
end
