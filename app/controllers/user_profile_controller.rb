class UserProfileController < ApplicationController
  def index
  end

  def new 
  end

  def show
    @posts = Post.where(user_id:current_user.id)
  end

  def edit
    @comment = Comment.find(params[:id])  
  end

  def destroy

  end  

  def another_user
    @user = User.find_by(id: params['id'])
  end

  def add_new_friend

  end

  def see_friend_request
    @friends = Friendship.where(receiver_id: current_user.id, confirmation: false)
  end

  def friend
    friends = Friendship.where(sender_id: current_user.id, confirmation: true)
    accepted_friends = Friendship.where(receiver_id: current_user.id, confirmation: true)
    @totle_friends = (friends + accepted_friends).uniq
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :image )    
  end
end
