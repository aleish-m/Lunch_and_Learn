class LearningSerializer
  include JSONAPI::Serializer
  set_id { nil }
  set_type :learning_resource
  attributes :country

  attribute :video do |resource|
    if resource.video.present?
      VideoSerializer.video_info(resource.video)
    else
      []
    end
  end

  attribute :images do |resource|
    ImageSerializer.all_images_info(resource.images)
  end
end
