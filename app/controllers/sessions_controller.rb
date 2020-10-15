class SessionsController < ApplicationController 

  def new 
  end 

  def create 
    #byebug
    @user = User.find_by(username: params[:user][:username]) 
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else
      login_path 
    end
  end 

  def destroy 
    session.delete(:user_id) 
    redirect_to root_path
  end

end