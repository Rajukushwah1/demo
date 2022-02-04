class UserProfileController < ApplicationController
  def show
    @posts = Post.where(user_id:current_user.id)
  end

  def edit

    @comment = Comment.find(params[:id])
  #   @user = current_user
  #   @updated_user = @user.update(user_params)    
   end

   def another_user
    @user = User.find_by(id: params['id'])
   end

  private
    def user_params
        params.require(:user).permit(:email, :name, :image, :image )    
    end
end
