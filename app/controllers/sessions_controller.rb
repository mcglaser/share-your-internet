class SessionsController < ApplicationController
  def new
  end
 

   def create
    @user = User.find_by(email: params[:user][:email])
    if params[:user][:password].blank? || @user.nil?
      redirect_to signin_path
    elsif @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to new_address_path
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



  protected

  def auth_hash
    request.env['omniauth.auth']
  end


end
