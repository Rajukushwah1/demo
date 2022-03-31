class MsgsController < ApplicationController
 def create
  @message = current_user.msgs.create(body: msg_params[:body], room_id: params[:room_id])
 end

 private
 def msg_params
  params.require(:msg).permit(:body)
 end
end
