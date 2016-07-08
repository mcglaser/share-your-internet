  def create
    if params[:user][:password].blank?
      redirect_to signin_path
    else
      @user = User.find_by(email: params[:user][:email])
      if @user.authenticate(params[:user][:password])
      	byebug
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
    end
  end



  def create
    if params[:user][:password].blank?
      redirect_to signin_path
    else
      @user = User.find_by(email: params[:user][:email])
      if user = Nil
        redirect_to signin_path
      else
        @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    end
  end




    def create
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
  end



---------------------

  This shit works:

    def create
    if params[:user][:password].blank?
      redirect_to signin_path
    else
      @user = User.find_by(email: params[:user][:email])
      if @user.nil?
        redirect_to signin_path
      else
        @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    end
  end



  ----------------


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
  end 

  -----------------------

  My Mona Lisa

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

  ---------------------



  def foursquare
    resp = Faraday.get("https://foursquare.com/oauth2/access_token") do |req|
      req.params['client_id'] = ENV['FOURSQUARE_CLIENT_ID']
      req.params['client_secret'] = ENV['FOURSQUARE_CLIENT_SECRET']
      req.params['grant_type'] = 'authorization_code'
      req.params['redirect_uri'] = "http://localhost:3000/auth"
      req.params['code'] = params[:code]
    end

    body = JSON.parse(resp.body)
    session[:token] = body["access_token"]
    @user = User.create
    session[params(:code)] = @user.id
    redirect_to user_path(@user.id)
  end






   def facebook
    @user = User.find_or_create_by(uid: auth_hash['uid']) do |u|
      u.email = auth_hash['info']['email']
    end
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end
  


private

    def logged_in?
      !!session[:token]
    end

    def authenticate_user
      client_id = ENV['FOURSQUARE_CLIENT_ID']
      redirect_uri = CGI.escape("http://localhost:3000/auth")
      foursquare_url = "https://foursquare.com/oauth2/authenticate?client_id=#{client_id}&response_type=code&redirect_uri=#{redirect_uri}"
      redirect_to foursquare_url unless logged_in?
    end




   <%= link_to("Sign Up Via Twitter!", "https://foursquare.com/oauth2/authenticate?client_id=MMTNA2RXEWJPHOYJCX3IPPJ2PLWNSKTF41324ODIVGANME14&response_type=code&redirect_uri=http://localhost:3000/auth") %>
   <br><br>








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
    @user = User.find(params[:id])

    @user.update(user_params)
    redirect_to root_url

  end




  def edit
  end

  def update
    @user = User.find(params[:user_id])

    @user.update(user_params)
    redirect_to root_url
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


