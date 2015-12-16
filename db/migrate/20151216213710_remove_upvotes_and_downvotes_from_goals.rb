class RemoveUpvotesAndDownvotesFromGoals < ActiveRecord::Migration
  def change
    remove_column :goals, :upvotes
    remove_column :goals, :downvotes
  end
end
