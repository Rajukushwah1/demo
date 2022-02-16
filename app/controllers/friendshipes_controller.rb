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
        @friendship.confirmation = false
       if @friendship.save
         redirect_to user_profile_path(current_user) 
       else
        render :new
       end
      end

      def show
       
        
      end
      def edit
       
      end

      def update
          
      end
     
      def destroy
        
        
      end 

end


 #  def index
 #     if current_user
 #      @post = Post.all
 #        render(@post)
 #       else
 #      @post = Post.all.where(user_id:current_user.id)
 #    end
 #  end


 # def new

 # end

 #  def self.request(user, friend)
 #    unless user == friend or Friendship.exists?(user, friend)
 #      transaction do
 #        create(:user => user, :friend => friend, :status => 'pending')
 #        create(:user => friend, :friend => user, :status => 'requested')
 #      end
 #    end
 #  end

 #    def self.accept(user, friend)
 #      transaction do
 #        accepted_at = Time.now
 #        accept_one_side(user, friend, accepted_at)
 #        accept_one_side(friend, user, accepted_at)
 #      end
 #    end

 #    def self.accept_one_side(user, friend, accepted_at)
 #      request = find_by_user_id_and_friend_id(user, friend)
 #      request.status = 'accepted'
 #      request.accepted_at = accepted_at
 #      request.save!
 #    end


