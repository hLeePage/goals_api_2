class User < ActiveRecord::Base
  has_secure_password

# Table associaions
  has_many :goals, dependent: :destroy
  has_many :comments
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

# Validations
  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }
  validates :password, length: { minimum: 8 }
  validates :first, presence: true, length: { maximum: 10 }
  validates :last, presence: true, length: { maximum: 20 }
  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

# Follow a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

# Unfollow a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

# Return true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

# Required for Doorkeeper
  def self.authenticate!(email, password)
    user = User.find_by_email(email)
    return false unless user
    user.authenticate(password)
  end

end
