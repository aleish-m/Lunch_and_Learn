FactoryBot.define do
  factory :favorite do
    recipe_title { Faker::Food.dish }
    recipe_link { Faker::Internet.url }
    country { Faker::Address.country }
    association :user
  end
end
