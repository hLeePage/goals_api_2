class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :update, :destroy]


  def index
    @goals = Goal.all
    render json: @goals
  end

  def show
    render json: @goal
  end

  def create
    @goal = Goal.new(goal_params)

    if @goal.save
      render json: @goal, status: :created, location: @goal
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      head :no_content
    else
      render json: @goal.errors, status: :unprocessable_entity
    end
  end


  def destroy
    @goal.destroy
    head :no_content
  end

  private

    def set_goal
      @goal = Goal.find(params[:id])
    end

    def goal_params
      params.require(:goal).permit(:body, :upvote, :downvote, :user_id, :completed)
    end
end