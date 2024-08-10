class Admin::DepartmentsController < ApplicationController
  
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
  
  private
  
  def department_params
    params.require(:department).permit(:name)
  end
    
  
end
