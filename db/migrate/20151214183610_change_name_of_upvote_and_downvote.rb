class ChangeNameOfUpvoteAndDownvote < ActiveRecord::Migration
  def change
    rename_column :goals, :upvote, :upvotes
    rename_column :goals, :downvote, :downvotes
  end
end
