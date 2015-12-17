class GoalSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :username, :body, :upvotes, :downvotes, :completed, :comments

  has_many :comments

  def username
    user = User.find(user_id)
    user.username
  end

  def upvotes
    object.upvotes
  end

  def downvotes
    object.downvotes
  end
end
