class UserSerializer < ActiveModel::Serializer
  attributes :username, :id, :first, :last, :email

  has_many :following
  has_many :followers
end
