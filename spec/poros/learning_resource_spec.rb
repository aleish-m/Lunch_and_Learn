require 'rails_helper'

RSpec.describe LearningResource do
  before :each do
    images_response = File.read('spec/fixtures/pakistan_image_data.json')
    images_data = JSON.parse(images_response, symbolize_names: true)
    @images = images_data.map { |image| Image.new(image) }

    video_response = File.read('spec/fixtures/video_data.json')
    video_data = JSON.parse(video_response, symbolize_names: true)
    @video = Video.new(video_data)

    @learning_resource = LearningResource.new(@video, @images, 'Pakistan')
  end

  describe 'initialization' do
    it 'instantiates as a Learning Resource object' do
      expect(@learning_resource).to be_a(LearningResource)
    end

    it 'has attributes' do
      expect(@learning_resource.country).to eq('pakistan')
      expect(@learning_resource.country).to_not eq('Pakistan')

      expect(@learning_resource.video).to be_a(Video)
      expect(@learning_resource.video).to respond_to(:title)
      expect(@learning_resource.video).to respond_to(:youtube_video_id)

      expect(@learning_resource.images).to be_an(Array)
      @learning_resource.images.each do |image|
        expect(image).to be_a(Image)
        expect(image).to respond_to(:alt_tag)
        expect(image).to respond_to(:url)
      end
    end

    it 'does not have attributes' do
      expect(@learning_resource).to_not respond_to(:recipe)
    end
  end
end
