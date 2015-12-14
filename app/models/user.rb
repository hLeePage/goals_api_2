class User < ActiveRecord::Base
  has_secure_password

  has_many :goals, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                foreign_key: "follower_id",
                                dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed

  validates :password, length: { minimum: 8 }


  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }

  validates :first, presence: true, length: { maximum: 10 }
  validates :last, presence: true, length: { maximum: 20 }
  validates :username, presence: true, length: { maximum: 50 },
                       uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }


  def self.authenticate!(email, password)
    user = User.find_by_email(email)
    return false unless user
    user.authenticate(password)
  end

end
