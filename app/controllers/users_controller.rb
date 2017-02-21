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
    @user = User.new(username: user_params[:username], password: user_params[:password])
    user_params[:user_dispositions].each do |dispo|
      UserDisposition.create!(dispo: dispo, user_id: @user.id)
    end
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
    params.require(:user).permit(:username, :password, user_dispositions: [])
  end
end
