class FavoriteSerializer
  def self.success
    {success: "Favorite added successfully"}
  end

  def self.error(status, message)
    { error: status,
      message: message }
  end
end