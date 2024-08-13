class Admin::OccupationsController < ApplicationController
  before_action :ensure_occupation, only: [:edit, :update, :show, :destroy]

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
  
  def update
    if @occupation.update(occupation_params)
      redirect_to admin_occupations_path, notice: "更新完了"
    else
      flash.now[:alert] = "更新失敗"
    end
  end
  
  def destroy
    @occupation.destroy
    redirect_to admin_occupations_path, notice: "削除完了"
  end
  
  private
  
  def ensure_occupation
    @occupation = Occupation.find(params[:id])
  end
  
  def occupation_params
    params.require(:occupation).permit(:name)
  end
  
end
