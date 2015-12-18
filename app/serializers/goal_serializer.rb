class GoalSerializer < ActiveModel::Serializer
  attributes :body, :id, :username, :user_id, :created_at, :upvotes, :downvotes, :completed, :comments

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
