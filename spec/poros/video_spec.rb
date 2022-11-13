require 'rails_helper'

RSpec.describe Video do
  before :each do
    response = File.read('spec/fixtures/video_data.json')
    video_data = JSON.parse(response, symbolize_names: true)
    @video = Video.new(video_data)
  end
  describe 'initialization' do
    it 'instantiates as a video object' do
      expect(@video).to be_a(Video)
    end

    it 'has attributes' do
      expect(@video.title).to eq('A Super Quick History of Pakistan')
      expect(@video.title).to_not eq('Mr History')

      expect(@video.youtube_video_id).to eq('GTmHYVUJTAM')
      expect(@video.youtube_video_id).to_not eq('https://i.ytimg.com/vi/GTmHYVUJTAM/default.jpg')
    end

    it 'does not have attributes' do
      expect(@video).to_not respond_to(:channel_title)
      expect(@video).to_not respond_to(:url)
      expect(@video).to_not respond_to(:description)
      expect(@video).to_not respond_to(:id)
    end
  end
end
