class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :body
      t.integer :upvote
      t.integer :downvote
      t.integer :user_id
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
