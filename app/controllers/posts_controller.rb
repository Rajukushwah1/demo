class PostsController < ApplicationController
  before_action :authenticate_user!

  def index 
    friends_ids = Friendship.where(sender_id: current_user.id, confirmation: true)&.map(&:receiver_id)
    accepted_friends_ids = Friendship.where(receiver_id: current_user.id, confirmation: true)&.map(&:sender_id)
    @total_friends_ids = (friends_ids + accepted_friends_ids).uniq
    @total_friends_ids << current_user.id
    @posts = Post.where(user_id: @total_friends_ids).order("updated_at desc")
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
      render 'new', status: :unprocessable_entity
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
    params.require(:post).permit(:title, :description, :image )
  end
end
