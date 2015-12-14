class GoalSerializer < ActiveModel::Serializer
  attributes :id, :body, :upvote, :downvote, :user_id, :completed
end
