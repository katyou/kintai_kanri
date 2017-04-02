class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:danger] = 'flash'
      render 'new'
    end
  end

  def delete
    @current_user = session[:user_id] = nil
    redirect_to root_url
  end
end
