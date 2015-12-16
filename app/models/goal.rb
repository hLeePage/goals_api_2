class Goal < ActiveRecord::Base

  validates :body, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_votable

  def upvotes
    self.get_upvotes.size
  end

  def downvotes
    self.get_downvotes.size
  end

end
