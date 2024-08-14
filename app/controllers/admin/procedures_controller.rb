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
    @procedure = Procedure.new
  end
end
