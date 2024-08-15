class Admin::PostsController < ApplicationController
  before_action :ensure_post, only: [:edit, :update, :show, :destroy]
  
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save!
      redirect_to admin_post_path(@post), notice: "投稿完了"
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  private
  
  def ensure_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:category_id, :title, :body, :level, :status, :files)
  end
  
end
