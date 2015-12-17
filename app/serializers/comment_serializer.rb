class CommentSerializer < ActiveModel::Serializer
  attributes :id, :username, :user_id, :goal_id, :body, :created_at

  def username
    user = User.find(user_id)
    user.username
  end

end
