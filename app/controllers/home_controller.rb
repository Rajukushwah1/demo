class HomeController < ApplicationController
  def index
    ActionCable.server.broadcast('notification_channel', 'You have visited the welcome page.')
  end  
end
