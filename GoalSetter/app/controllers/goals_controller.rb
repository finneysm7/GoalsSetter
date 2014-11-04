class GoalsController < ApplicationController
  
  def new
    @goal = Goal.new
    render :new
  end
  
  def index
    @goals = Goal.all
    render :index
  end
  
  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal) 
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end
  
  def show
    @goal = Goal.find(params[:id])
    render :show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy 
  end
  
  private
  def goal_params
    params.require(:goal).permit(:title, :user_id, :status, :private?)
  end
end
