class LikesController < ApplicationController
  def create
		@like = current_user.likes.new(like_params)
		if !@like.save
			LikeMailer.with(user: current_user, like: @like).like_created.deliver_later
			flash[:notice] = @like.errors.full_messages.to_sentence
		end	

		redirect_to posts_path
	end

	def destroy
		@like = current_user.likes.find(params[:id])
		post = @like.post
		@like.destroy
		redirect_to posts_path
	end

	private
	def like_params
		params.require(:like).permit(:post_id)
	end
end
