class ImageSerializer
  def self.all_images_info(images)
    images.map do |image|
      {
        alt_tag: image.alt_tag,
        url: image.url
      }
    end
  end
end
