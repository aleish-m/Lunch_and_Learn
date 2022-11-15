require 'rails_helper'

RSpec.describe Recipe do
  before :each do
    response = File.read('spec/fixtures/recipe_data.json')
    recipe_data = JSON.parse(response, symbolize_names: true)
    @recipe = Recipe.new(recipe_data, 'Italy')
  end
  describe 'initialization' do
    it 'instantiates as a Recipe object' do
      expect(@recipe).to be_a(Recipe)
    end

    it 'has attributes' do
      expect(@recipe.title).to eq("Baked Italy")
      expect(@recipe.title).to_not eq("Food52")

      expect(@recipe.url).to eq("https://food52.com/recipes/10380-baked-italy")
      expect(@recipe.url).to_not eq("http://www.edamam.com/ontologies/edamam.owl#recipe_1cb0bfc335666ef2f1ff31f4ba7ed4a5")

      expect(@recipe.country).to eq('Italy')
      expect(@recipe.country).to_not eq('italy')

      expect(@recipe.image).to eq("https://edamam-product-images.s3.amazonaws.com/web-img/0d8/0d8f382870e658d838cb18c9587558ac.JPG?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDGpiRH%2F1At%2B7QKZIebD%2BIawmQNYqJ%2BYZHE8Y3Hr9v4xQIhAOuaf%2F0vFCM2OQVk96LF%2BgwxCwoYk%2FcUMc3%2FoTZx58izKtUECKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMTg3MDE3MTUwOTg2IgxdB2eY25IE8FasKO4qqQQdvW7tUfmrs298QqEObiDFTcikKlNtLf4jIASiQNWkUHT6LiKiXCwiET3Ju8IwjKYZcbc1uktJbqL2mcKgPDBDR2yoFuffu8GRgKtBQ6VU9pUWJLoPPcGhgFt0Qa9HPptj%2BD%2FQuVB1B00IMKTS2fO9Xyufp98IKXViwkqXUiQOqki1ZMCwANprsb6QzQ4J%2FlOmnjOM0QKnQpW9ZJSWUwD34jdI29VinbtE5BqG%2F0y238Oqsh6ttE%2FHhw6Nu9FyHM658eNb5VV3bkR8M8k5WpY01K281G9dgVtnL8UyPFKTCiCfGfqg61qLYmlMhoru8J3WDg8O87SICvkb6TFIid9BujOA036K1T358rnLBiCnKaNi1KmJ17gxuk8ZLKHYTPb6CIxUAoFzCo%2Bpfmp%2Brl0YABYRZsvjsUsGOCxrnya1ZUCbWVekOeZ3qTHyjh4%2F7RFzpYCPBLg0Tmi4spGIowj0%2BT1RPxar8HK68mACipluLMExOlRYe1E9jbywXcU94XeO%2FiUbbxUnX7ToLwJ7ziF8knBQ1mpAz35%2FRkQxhq1wo1TwmN69IUz%2Fl5kYYuRM7ZNc8O2pcC1Bl7836vfZEqkTmjr7Ra5nmqMIRqSwbMIv6XkKqxK4YOzaDQtouz%2Bn48sTsuA130Qdra6ZFF%2B2ka3BsJMDxrWbsWPFYRS66wBwvFhSSW1FYCLQvIuDQihU3LCNBb5B9ryh88Sdfy7Is%2B7eK1Prs0WLgy%2FlMPOovZsGOqgBiCvT18LD90L3zhg6C0HRJKQ2HeYROqja4QMqKw7EBhHqwXt8WZjxx%2B70IEE5KFPB1ovSngg29nlp%2BYTgLmnkxVbA8WxDtLyJGNAL3dz0KO4uOQwhJgjxMItvHGsuzYk3L5W4rE7y818nhxtio0t%2BJE9JoNMNXHUEmQCoUpofQY5EzLuKX5DtGDnarga7O8p1VwiXpJ1ZclTTkm%2BBLtJ5WX%2Bhk4aR2s%2F7&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221112T083719Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFH2QGZHWZ%2F20221112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=56f6a73c007ced32bd6742171ed20ed1aadbd68fcd534b2b43538810285312a0")

      expect(@recipe.image).to_not eq("https://edamam-product-images.s3.amazonaws.com/web-img/0d8/0d8f382870e658d838cb18c9587558ac-m.JPG?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEKn%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJIMEYCIQDGpiRH%2F1At%2B7QKZIebD%2BIawmQNYqJ%2BYZHE8Y3Hr9v4xQIhAOuaf%2F0vFCM2OQVk96LF%2BgwxCwoYk%2FcUMc3%2FoTZx58izKtUECKH%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEQABoMMTg3MDE3MTUwOTg2IgxdB2eY25IE8FasKO4qqQQdvW7tUfmrs298QqEObiDFTcikKlNtLf4jIASiQNWkUHT6LiKiXCwiET3Ju8IwjKYZcbc1uktJbqL2mcKgPDBDR2yoFuffu8GRgKtBQ6VU9pUWJLoPPcGhgFt0Qa9HPptj%2BD%2FQuVB1B00IMKTS2fO9Xyufp98IKXViwkqXUiQOqki1ZMCwANprsb6QzQ4J%2FlOmnjOM0QKnQpW9ZJSWUwD34jdI29VinbtE5BqG%2F0y238Oqsh6ttE%2FHhw6Nu9FyHM658eNb5VV3bkR8M8k5WpY01K281G9dgVtnL8UyPFKTCiCfGfqg61qLYmlMhoru8J3WDg8O87SICvkb6TFIid9BujOA036K1T358rnLBiCnKaNi1KmJ17gxuk8ZLKHYTPb6CIxUAoFzCo%2Bpfmp%2Brl0YABYRZsvjsUsGOCxrnya1ZUCbWVekOeZ3qTHyjh4%2F7RFzpYCPBLg0Tmi4spGIowj0%2BT1RPxar8HK68mACipluLMExOlRYe1E9jbywXcU94XeO%2FiUbbxUnX7ToLwJ7ziF8knBQ1mpAz35%2FRkQxhq1wo1TwmN69IUz%2Fl5kYYuRM7ZNc8O2pcC1Bl7836vfZEqkTmjr7Ra5nmqMIRqSwbMIv6XkKqxK4YOzaDQtouz%2Bn48sTsuA130Qdra6ZFF%2B2ka3BsJMDxrWbsWPFYRS66wBwvFhSSW1FYCLQvIuDQihU3LCNBb5B9ryh88Sdfy7Is%2B7eK1Prs0WLgy%2FlMPOovZsGOqgBiCvT18LD90L3zhg6C0HRJKQ2HeYROqja4QMqKw7EBhHqwXt8WZjxx%2B70IEE5KFPB1ovSngg29nlp%2BYTgLmnkxVbA8WxDtLyJGNAL3dz0KO4uOQwhJgjxMItvHGsuzYk3L5W4rE7y818nhxtio0t%2BJE9JoNMNXHUEmQCoUpofQY5EzLuKX5DtGDnarga7O8p1VwiXpJ1ZclTTkm%2BBLtJ5WX%2Bhk4aR2s%2F7&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20221112T083719Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3600&X-Amz-Credential=ASIASXCYXIIFH2QGZHWZ%2F20221112%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=515323b5db9cb9c62a9458939e409ea6fe27ac36d44848d419201d8ce0809c1b")
    end

    it 'does not have attributes' do
      expect(@recipe).to_not respond_to(:meal_type)
      expect(@recipe).to_not respond_to(:total_time)
      expect(@recipe).to_not respond_to(:dish_type)
      expect(@recipe).to_not respond_to(:calories)
      expect(@recipe).to_not respond_to(:yield)
    end
  end
end