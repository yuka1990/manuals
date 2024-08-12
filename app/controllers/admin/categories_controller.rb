class Admin::CategoriesController < ApplicationController
  before_action :ensure_category, only: [:edit, :update, :show, :destroy]
  
  def index
    @category = Category.new
    @categories = Category.all
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "投稿完了"
    else
      @categories = Category.all
      render :index
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def destroy
    @category.destroy
    redirect_to admin_categories_path, notice: "削除完了"
  end
  
  private
  
  def ensure_category
    @category = Category.find(params[:id])
  end
  
  def category_params
    params.require(:category).permit(:name)
  end
  
end
