class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)

    # {
    #   followed_id: 4567
    # }
  end

  def destroy
    user = Relationship.find(params[:id])
    current_user.unfollow(user)
  end

end
