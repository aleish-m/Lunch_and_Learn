class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :api_key

  def self.error(status, message)
    { error: status,
      message: message }
  end
end
