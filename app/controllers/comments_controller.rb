class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  def index
    comments = Comment.all
    render json: comments
  end

  def create
    comment = Comment.new(comment_params)
    goal = Goal.find(params[:goal_id])
    comment.user = current_user
    comment.goal_id = goal.id
    
    if comment.save
      render json: comment, status: :created, location: comment
    else
      render json: comment.errors, status: 422
    end
  end

  def show
    render json: comment
  end

  def update

  end

  def destroy
    comment.destroy
    head :no_content
  end

####################
  private

  def set_comment
    comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
