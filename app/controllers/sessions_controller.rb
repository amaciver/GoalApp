class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    username, password = user_params.values
    @user = User.find_by_credentials(username, password)
    if @user
      login(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = "Invalid Creds"
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
