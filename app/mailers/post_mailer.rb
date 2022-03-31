class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_created.subject
  #
  def post_created
    @user = params[:user]
    @post = params[:post]
    @greeting = "Hi"

    # friends_ids = Friendship.where(sender_id: current_user.id, confirmation: true)&.map(&:receiver_id)
    # accepted_friends_ids = Friendship.where(receiver_id: current_user.id, confirmation: true)&.map(&:sender_id)
    # @total_friends_ids = (friends_ids + accepted_friends_ids).uniq
     
    # friends_ids = Friendship.where(sender_id: @user.id, confirmation: true)
    # friends_emails = User.where(id: friends_ids.pluck(:receiver_id)).pluck(:email)
    # @total_friends_email = friends_emails

    # friends = Friendship.where(sender_id: @user.id, confirmation: true)
    # friends_emails = User.where(id: friends.pluck(:receiver_id)).pluck(:email)
    # accepted_friends = Friendship.where(receiver_id: @user.id, confirmation: true)
    # accepted_friends_emails = User.where(id: accepted_friends.pluck(:sender_id)).pluck(:email)
    # @total_friends_email = friends_emails #+ accepted_friends_emails

    attachments['rails4.png'] = File.read('app/assets/images/rails4.png')
    mail(
      #from: User.where(current_user: email),
       #from: @user.email,     
     from: "rakushwah@bestpeers.com",
     #from: User.last.email,
     to: User.last.email,
     #cc: @total_friends_email.each { |friend| friend },
     #to: @total_friends_email.each { |friend| friend },
     #cc: User.all.pluck(:email),
     #bcc: User.last.email, 
     subject: "New post created "
         )
  end   
end
