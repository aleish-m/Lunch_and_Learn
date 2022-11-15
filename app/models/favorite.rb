class Favorite < ApplicationRecord
  belongs_to :user

  validates_presence_of :recipe_title, :recipe_link, :country, :user_id
end
