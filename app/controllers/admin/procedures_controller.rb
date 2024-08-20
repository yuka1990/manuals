class Admin::ProceduresController < ApplicationController
  before_action :ensure_procedure, only: [:edit, :update, :show, :destroy]
  before_action :ensure_post, only: [:index, :update, :show]
  
  def new
    @procedure = Procedure.new
  end
  
  
  def create
    post = Post.find(params[:post_id])
    @procedure = Procedure.new(procedure_params)
    @procedure.post_id = post.id
    if @procedure.save
      redirect_to admin_post_path(params[:post_id]), notice: "投稿完了"
    end
  end
  
  def index
    @procedures = @post.procedures
  end
  
  def show
  end
  
  def update
    if @procedure.update(procedure_params)
      redirect_to admin_post_path(@post), notice: "更新完了"
    else
      flash.now[:alert] = "Failed to save"
      render :edit
    end
  end
  
  def destroy
    @procedure.destroy
    redirect_to admin_post_path(params[:post_id])
  end
  
  private
  
  def ensure_procedure
    @procedure = Procedure.find(params[:id])
  end
  
  def ensure_post
    @post = Post.find(params[:post_id])
  end
  
  def procedure_params
    params.require(:procedure).permit(:post_id, :procedure_number, :title, :explain, :image)
  end
  
end
