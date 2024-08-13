class Admin::DepartmentsController < ApplicationController
  before_action :ensure_department, only: [:edit, :update, :show, :destroy]
  
  def index
    @department = Department.new
    @departments = Department.all
  end
  
  def create
    @department = Department.new(department_params)
    if @department.save
      redirect_to admin_departments_path, notice: "投稿完了"
    else
      @departments = Department.all
      render :index
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @department.update(department_params)
      redirect_to admin_departments_path, notice: "更新完了"
    else
      flash.now[:alert] = "更新失敗"
      render :edit
    end
  end
  
  def destroy
    @department.destroy
    redirect_to admin_departments_path, notice: "削除完了"
  end
  
  private
  
  def ensure_department
    @department = Department.find(params[:id])
  end
  
  def department_params
    params.require(:department).permit(:name)
  end
  
end