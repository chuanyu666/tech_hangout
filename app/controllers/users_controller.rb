class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def login

  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      cookies[:auth_token] = @user.auth_token
      redirect_to :root
    else
      render :signup
    end
  end

  def create_login_session
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
    #  session[:user_id] = user.id
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      flash.notice = 'Login Success!'
      redirect_to :root
    else
      flash.notice = 'Username or password incorrect!'
      redirect_to :login
    end
  end

  def logout
   # session[:user_id] = nil
    cookies.delete(:auth_token)
    redirect_to :root
  end

  private
  def user_params
    params.require(:user).permit!
  end
end
