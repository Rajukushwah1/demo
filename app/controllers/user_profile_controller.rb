class UserProfileController < ApplicationController
  def index
    #@user_profiles = UserProfile.paginate(:page => params[:page], :per_page => 5)
  end

  def new 
    
  end

  def show
    
    @posts = Post.where(user_id:current_user.id)
  end

  def edit
    @comment = Comment.find(params[:id])  
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
  end  

  def another_user
    @user = User.find_by(id: params['id'])
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :image )    
  end
end
