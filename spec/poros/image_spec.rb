require 'rails_helper'

RSpec.describe Image do
  before :each do
    response = File.read('spec/fixtures/image_data.json')
    image_data = JSON.parse(response, symbolize_names: true)
    @image = Image.new(image_data)
  end
  describe 'initialization' do
    it 'instantiates as a Image object' do
      expect(@image).to be_a(Image)
    end

    it 'has attributes' do
      expect(@image.alt_tag).to eq('woman in red and white dress holding brown wooden stick standing on white sand during daytime')
      expect(@image.alt_tag).to_not eq('Little moana from maldives  ♥️☺')

      expect(@image.url).to eq('https://images.unsplash.com/photo-1591211014896-25983a0990e8?ixid=MnwzODAyNDB8MHwxfHNlYXJjaHwxfHxNYWxkaXZlc3xlbnwwfHx8fDE2NjgzMjAyNDM&ixlib=rb-4.0.3')
      expect(@image.url).to_not eq('https://images.unsplash.com/photo-1591211014896-25983a0990e8?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAyNDB8MHwxfHNlYXJjaHwxfHxNYWxkaXZlc3xlbnwwfHx8fDE2NjgzMjAyNDM&ixlib=rb-4.0.3&q=80&w=1080')
    end

    it 'does not have attributes' do
      expect(@image).to_not respond_to(:likes)
      expect(@image).to_not respond_to(:user)
      expect(@image).to_not respond_to(:location)
      expect(@image).to_not respond_to(:id)
      expect(@image).to_not respond_to(:created_at)
    end
  end
end
