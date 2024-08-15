class Admin::ProceduresController < ApplicationController
  before_action :ensure_procedure, only: [:edit, :update, :show, :destroy]
  
  def create
    post = Post.find(params[:id])
    @procedure = Procedure.new(procedure_params)
    @procedure.post_id = post.id
    if @procedure.save
      redirect_to admin_post_path(@post), notice: "投稿完了"
    end
  end
  
  def index
    @post = Post.find(params[:post_id])
    @procedures = @post.procedures
  end
  
  def show
  end
  
  def update
    if @procedure.save(procedure_params)
      redirect_to admin_post_path(@post), notice: "更新完了"
    else
      flash.now[:alert] = "Failed to save"
      render :edit
    end
  end
  
  def destroy
    @procedure.destroy
    redirect_to admin_posts_path
  end
  
  private
  
  def ensure_procedure
    @procedure = Procedure.find(params[:id])
  end
  
  def procedure_params
    params.require(:procedure).permit(:post_id, :procedure_number, :title, :explain)
  end
  
end
