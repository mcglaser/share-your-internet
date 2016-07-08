class AddressesController < ApplicationController



  def new
       @address = Address.new
  end

  def create
    @address = Address.create(address_params)
    if @address.valid?
      redirect_to root_url
    else
      render :new
    end   
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def index
       @addresses = Address.all
  end

  def show

  end


  private

    def address_params
      params.require(:address).permit(:user_id, :address_line_one, :address_line_two, :city, :state, :postal_code)
    end



end
