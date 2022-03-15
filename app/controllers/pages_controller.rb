class PagesController < ApplicationController
   before_action :authenticate_user!

  def chat
    @messages = Message.last(15)
    @message = Message.new
  end
end
