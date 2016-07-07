class UsersController < ApplicationController


 def new
   @user = User.new
 end

  def create
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
       render :new   
     end   
  end


  def address
  end




  def edit
  end

  def update
  end

  def destroy
  end

  def index
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end


end
