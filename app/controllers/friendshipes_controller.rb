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
     redirect_to new_user_profile_path
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
    redirect_to new_user_profile_path
  end 
end

