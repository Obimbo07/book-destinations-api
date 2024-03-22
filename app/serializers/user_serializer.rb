class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :id, :email, :created_at
end
