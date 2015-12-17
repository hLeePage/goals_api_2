class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :goal_id, :body, :created_at
end
