require 'rails_helper'

RSpec.describe Sight do
  before :each do
    sight_response = File.read('spec/fixtures/sight_data.json')
    sight_data = JSON.parse(sight_response, symbolize_names: true)
    @sight = Sight.new(sight_data)
  end

  describe 'initialization' do
    it 'instantiates as a Sight object' do
      expect(@sight).to be_a(Sight)
    end

    it 'has attributes' do
      expect(@sight.name).to eq('Château de Boussac')
      expect(@sight.name).to_not eq('Chemin du Grand Moulin')

      expect(@sight.address).to eq('Château de Boussac, Chemin du Grand Moulin, 23600 Boussac, France')
      expect(@sight.address).to_not eq('Chemin du Grand Moulin, 23600 Boussac, France')

      expect(@sight.place_id).to eq('5122288c0611b0014059891c1a0c8a2c4740f00102f901f7734e0b000000009203134368c3a27465617520646520426f7573736163')
      expect(@sight.place_id).to_not eq(189690871)
    end

    it 'does not have attributes' do
      expect(@sight).to_not respond_to(:municipality)
      expect(@sight).to_not respond_to(:geometry)
      expect(@sight).to_not respond_to(:historic)
    end
  end
end