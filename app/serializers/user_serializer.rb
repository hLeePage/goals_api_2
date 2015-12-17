class UserSerializer < ActiveModel::Serializer
  attributes :id, :first, :last, :username, :email
end
