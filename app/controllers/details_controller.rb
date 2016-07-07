class DetailsController < ApplicationController
  def new
    @detail = Detail.new
  end

  def create
    @detail = Detail.create(detail_params)  
      redirect_to root_url 
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
  end


  private

    def detail_params
      params.require(:detail).permit(:user_id, :pays_for_internet, :lives_in_community)
    end


end
