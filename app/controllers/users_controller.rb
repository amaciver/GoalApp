class UsersController < ApplicationController
  before_filter :require_signin, except: [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def new
    @form_hidden = true
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
