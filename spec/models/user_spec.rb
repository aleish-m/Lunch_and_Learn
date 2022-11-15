require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }

    it { should validate_uniqueness_of :email }
  end

  describe 'relationships' do
    it { should have_many(:favorites) }
  end

  describe 'instance methods' do
    describe '#create_new_api_key' do
      it 'creates a random 16 digit API Key for user' do
        user = User.new(name: 'Joe Johnson', email: 'joeyjohn@mail.com')

        expect(user.api_key).to be(nil)

        user.create_new_api_key
        expect(user.api_key).to be_a(String)
        expect(user.api_key.length).to eq(22)
      end

      it 'creates a new api key for a user before it saves teh user to database' do
        user = User.new(name: 'Joe Johnson', email: 'joeyjohn@mail.com')

        expect(user.api_key).to be(nil)

        user.save

        expect(user.api_key).to be_a(String)
      end

      it 'does not update the api key for a user when user info is updated' do
        user = User.create(name: 'Joe Johnson', email: 'joeyjohn@mail.com')
        user_original_api_key = user.api_key

        expect(user.api_key).to be_a(String)

        user.update(name: 'Joseph Johnson')

        expect(user.api_key).to eq(user_original_api_key)
      end
    end
  end
end
