class SessionsController < ApplicationController
  def new
  end


   def create
    @user = User.find_by(email: params[:user][:email])
    if params[:user][:password].blank? || @user.nil?
      redirect_to signin_path
    elsif @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
  end 



  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end






  def destroy
    session.delete :user_id
    redirect_to root_url
  end


end
