class GoalsController < ApplicationController

  before_action :set_goal, only: [:show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @goals = Goal.all
    render json: @goals
  end

  def show
    render json: @goal
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    @goal.upvotes = 0
    @goal.downvotes = 0
    @goal.completed = false

    if @goal.save
      render json: @goal, status: :created, location: @goal
    else
      render json: @goal.errors, status: 422
    end
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      head :no_content
    else
      render json: @goal.errors, status: 422
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
      params.require(:goal).permit(:body, :upvotes, :downvotes, :completed)



      # {
      #   goal: {
      #     body: "",
      #     upvotes: "",
      #     downvotes: "",
      #     completed: ""
      #   }
      # }

    end
end
