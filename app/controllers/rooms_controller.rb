class RoomsController < ApplicationController
  before_action :authenticate_user!
  def index
    # @rooms = Room.all
    # @rooms = Room.find([:id])
    @room = Room.new
    @rooms = Room.public_rooms

    @users = User.all_except(current_user)
    render 'index'
  end

  def show
     @single_room = Room.find(params[:id])
     @room = Room.new
     @rooms = Room.public_rooms

     @message = Msg.new
     @messages = @single_room.msgs.order(create_at: 'asc')

     @users = User.all_except(current_user)
     render 'index'
  end
    
  def create
   @room = Room.create(name: params['room']['name'])
  end
end
