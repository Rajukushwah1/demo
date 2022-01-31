class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @post = Post.all 
    #debugger
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
    uploaded_file = params['post']['image']
    file = File.open(Rails.root.join('app','assets', 'images', uploaded_file.original_filename), 'wb')
    file.write(uploaded_file.read)
    
    @post.image = file.path

   
    
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(posts_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
 
  def destroy
     @post = Post.find(params[:id])
     @post.destroy
    redirect_to post_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :description)
  end
end
