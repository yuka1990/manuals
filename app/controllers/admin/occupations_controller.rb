class Admin::OccupationsController < ApplicationController
  

  def index
    @occupation = Occupation.new
    @occupations = Occupation.all
  end
  
  def create
    @occupation = Occupation.new(occupation_params)
    if @occupation.save
      redirect_to admin_occupations_path, notice: "投稿完了"
    else
      @occupations = Occupation.all
      render :index
    end
  end
  
  def show
  end
  
  def edit
  end
  
  private
  
  def occupation_params
    params.require(:occupation).permit(:name)
  end
  
end
