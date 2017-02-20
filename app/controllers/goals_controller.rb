class GoalsController < ApplicationController

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user
    if @goal.save
      redirect_to (user_url(@goal.user))
    else
      flash[:errors] = @goal.errors.full_messages
      redirect_to user_url(@goal.user)
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def goal_params
    params.require(:goal).permit(:body)
  end
end
