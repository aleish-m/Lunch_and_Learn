class User < ApplicationRecord
  has_many :favorites

  validates_presence_of :name, :email, :api_key
  validates_uniqueness_of :email, :api_key
  before_validation :create_new_api_key, on: :create
 
  def create_new_api_key
    self.api_key = SecureRandom.urlsafe_base64
  end
end
