class FriendshipesController < ApplicationController
  def index
    @friendship = Friendship.all
  end

  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new
    @friendship.sender_id = params[:sender_id]
    @friendship.receiver_id = params[:receiver_id]
    @friendship.confirmation = params[:confirmation]
    if @friendship.save
     redirect_to see_friend_request_path
    else
     render :new
    end
  end

  def show      
  end

  def edit
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.update(confirmation: true)
    redirect_to friend_path
  end

  def update
   @friendship = Friendship.find_by(id: params[:id])
   if @friendship.update
     @friendship.save
     redirect_to @friendship
   else
    render 'index'
   end
  end

  def destroy
    @friendship = Friendship.find_by(id: params[:id])
    @friendship.destroy
    redirect_to add_new_friend_path
  end 

  def add_new_friend
    @friends = Friendship.all
  end

  def see_friend_request
    @friends = Friendship.where(receiver_id: current_user.id, confirmation: false)
  end

  def friend
    friends = Friendship.where(sender_id: current_user.id, confirmation: true)
    accepted_friends = Friendship.where(receiver_id: current_user.id, confirmation: true)
    @totle_friends = (friends + accepted_friends).uniq
  end

end

