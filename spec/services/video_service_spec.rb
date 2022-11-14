require 'rails_helper'

RSpec.describe VideoService do
  describe 'get video API endpoints' do
    it 'can get videos from youtube for a country', :vcr do
      video_data = VideoService.get_country_video('thailand')

      expect(video_data).to be_a(Hash)
      expect(video_data).to have_key(:kind)
      expect(video_data[:kind]).to be_a(String)
      expect(video_data).to have_key(:items)
      expect(video_data[:items]).to be_an(Array)

      video_data[:items].each do |video|
        expect(video).to be_a(Hash)

        expect(video).to have_key(:id)
        expect(video[:id]).to be_a(Hash)
        expect(video[:id]).to have_key(:kind)
        expect(video[:id][:kind]).to be_a(String)
        expect(video[:id]).to have_key(:videoId)
        expect(video[:id][:videoId]).to be_a(String)

        expect(video).to have_key(:snippet)
        expect(video[:snippet]).to be_a(Hash)
        expect(video[:snippet]).to have_key(:publishedAt)
        expect(video[:snippet][:publishedAt]).to be_a(String)
        expect(video[:snippet]).to have_key(:title)
        expect(video[:snippet][:title]).to be_a(String)
        expect(video[:snippet]).to have_key(:description)
        expect(video[:snippet][:description]).to be_a(String)
        expect(video[:snippet]).to have_key(:channelTitle)
        expect(video[:snippet][:channelTitle]).to be_a(String)
        expect(video[:snippet]).to have_key(:publishTime)
        expect(video[:snippet][:publishTime]).to be_a(String)
      end
    end
  end
end
