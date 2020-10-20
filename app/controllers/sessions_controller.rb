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