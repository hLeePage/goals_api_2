class GoalSerializer < ActiveModel::Serializer
  attributes :id, :body, :upvotes, :downvotes, :user_id, :completed
end
