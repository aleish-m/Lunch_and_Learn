require 'rails_helper'

RSpec.describe ImageService do
  describe 'get images API endpoints' do
    it 'can get a list of images for a country', :vcr do
      image_data = ImageService.get_images_for_country('thailand')

      expect(image_data).to be_a(Hash)
      expect(image_data).to have_key(:total)
      expect(image_data[:total]).to be_a(Integer)
      expect(image_data).to have_key(:results)
      expect(image_data[:results]).to be_an(Array)

      image_data[:results].each do |image|
        expect(image).to be_a(Hash)

        expect(image).to have_key(:id)
        expect(image[:id]).to be_a(String)
        expect(image).to have_key(:created_at)
        expect(image[:created_at]).to be_a(String)
        expect(image).to have_key(:alt_description)
        expect(image[:alt_description]).to be_a(String)
        expect(image).to have_key(:urls)
        expect(image[:urls]).to be_a(Hash)
        expect(image[:urls]).to have_key(:raw)
        expect(image[:urls][:raw]).to be_a(String)
        expect(image[:urls]).to have_key(:regular)
        expect(image[:urls][:regular]).to be_a(String)

        expect(image).to have_key(:likes)
        expect(image[:likes]).to be_a(Integer)

        expect(image).to have_key(:user)
        expect(image[:user]).to be_a(Hash)
        expect(image[:user]).to have_key(:username)
        expect(image[:user][:username]).to be_a(String)
        expect(image[:user]).to have_key(:name)
        expect(image[:user][:name]).to be_a(String)
      end
    end
  end
end
