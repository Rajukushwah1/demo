class MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    # friends_ids = Friendship.where(sender_id: current_user.id, confirmation: true)&.map(&:receiver_id)
    # accepted_friends_ids = Friendship.where(receiver_id: current_user.id, confirmation: true)&.map(&:sender_id)
    # @total_friends_ids = (friends_ids + accepted_friends_ids).uniq
    # @total_friends_ids << current_user.id
    # @message = Message.where(user_id: @total_friends_ids).order("updated_at desc")
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end
end
