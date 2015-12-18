class CommentSerializer < ActiveModel::Serializer
  attributes  :body, :id, :username, :user_id, :goal_id, :created_at

  def username
    user = User.find(user_id)
    user.username
  end


end
