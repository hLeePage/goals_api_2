class UserSerializer < ActiveModel::Serializer
  attributes :id, :first, :last, :username, :email

  has_many :following
  has_many :followers
  has_many :goals
end
