class PostsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index 
    
    friends = Friendship.where(sender_id: current_user.id, confirmation: true)
    accepted_friends = Friendship.where(receiver_id: current_user.id, confirmation: true)
    @total_friends = (friends + accepted_friends).uniq
    @friends_ids = []
    @total_friends.each do |friend|
     if friend.receiver_id == current_user.id
      @friends_ids.push(friend.sender_id)
     else
      @friends_ids.push(friend.receiver_id) 
     end    
    end 
    @posts = Post.order("updated_at desc")
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
