class SessionsController < ApplicationController 

  def new 
  end 

  def create 
    #byebug
    @user = User.find_by(username: params[:user][:username]) 
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to boards_path
    else
      @error = 'Login failed. Please try again.'
      render 'sessions/new'
    end
  end 

  def destroy 
    session.delete(:user_id) 
    redirect_to root_path
  end

end