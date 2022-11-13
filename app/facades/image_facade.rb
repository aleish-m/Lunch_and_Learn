class ImageFacade

  def self.find_country_images(country)
    images_data = ImageService.get_images_for_country(country)
    images_data[:results].map do |image_data|
      Image.new(image_data)
    end
  end
end
