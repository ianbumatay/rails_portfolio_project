class SessionsController < ApplicationController 

  def new 
  end 

  def create 
    @user = User.find_by(username: params[:user][:username]) 
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to boards_path
    else
      flash[:message] = "Login failed. Please try again."
      redirect_to '/login'
    end
  end 

  def destroy 
    session.delete(:user_id)  
    redirect_to root_path
  end  

  

  def omniauth
    @user = User.from_omniauth(auth) 
    @user.save 
    session[:user_id] = @user.id 
    redirect_to boards_path 
  end
   

  private  

  def auth
    request.env['omniauth.auth']
  end

end