class Goal < ActiveRecord::Base

  validates :body, presence: true
  validates :user_id, presence: true

  #acts_as_votable

  belongs_to :user
  has_many :comments, dependent: :destroy

  # def upvotes
  #   @goal.get_likes.size
  # end
  #
  # def downvotes
  #   @goal.get_dislikes.size
  # end

end
