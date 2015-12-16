class GoalSerializer < ActiveModel::Serializer
  attributes :id, :body, :user_id, :completed
end
