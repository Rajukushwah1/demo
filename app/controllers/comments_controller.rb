class CommentsController < ApplicationController
	# before_action :find_post
  # before_action :find_comment, only: [:destroy, :edit, :update]
  before_action :authenticate_user!
  def index
    @comment = Comment.all
     #debugger
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find_by(id: params['post_id'])
    @comment = Comment.new(comment_params)
    @comment.post_id = @post.id if @post.present?
    @comment.user_id = current_user.id
   # debugger
    if @comment.save
      flash[:success] = "Comment successfully added"
      redirect_to post_path(@post)
    else
      redirect_to post_path(@post)
      flash[:error] = @comment.errors.full_messages
    end
  end

  def show
    @comment = Comment.find(params[:id])
    if @comment.user_id != current_user.id
      redirect_to @comment.post
    end
    
  end
  def edit
    @comment = Comment.find(params[:id])
    if @comment.user_id != current_user.id
      redirect_to @comment.post
    end
  end

  def update
       @comment = Comment.find(params[:id])

       if @comment.update(comment_params)
        @post = Post.find_by(id: @comment.post_id)
          redirect_to post_path(@post)
       else
          render 'edit'
       end
  end
 
  def destroy
    # @comment = @post.Comments.find(params[:id])
    # @comment.destroy

     @comment = Comment.find(params[:id])
     @post = Post.find_by(id: @comment.post_id)
     @comment.destroy
     redirect_to post_path(@post)

     if @comment.user_id != current_user.id
      redirect_to @comment.post
     end
    
  end



  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
