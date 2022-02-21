
class PostsController < ApplicationController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index 

    @posts = Post.select{|p| p if p.title.present? && p.user.present? }
  end

  def me
    @posts = current_user.posts
    render :index
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
    
  end

  def show
    @post = Post.find(params[:id])


  end

  def edit
    @post = Post.find(params[:id])

    if @post.user_id != current_user.id
      redirect_to posts_path
    end
    
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
 
  def destroy
    
    @post = Post.find(params[:id])
     @post.destroy
     redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :image, :image )
  end
end
