class FavoriteSerializer
  include JSONAPI::Serializer
  attributes :recipe_title, :recipe_link, :country, :created_at 
  
  def self.success
    {success: "Favorite added successfully"}
  end

  def self.error(status, message)
    { error: status,
      message: message }
  end
end