class LikeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.like_mailer.like_created.subject
  #
  def like_created
    @user = params[:user]
    @like = params[:like]
    @greeting = "Hi"
    attachments['rails3.png'] = File.read('app/assets/images/rails3.png')
    mail(
     from: "rakushwah@bestpeers.com",
     to: User.first.email,
     cc: User.all.pluck(:email), 
     bcc: "secret@corsego.com", 
     subject: "New Like created")
  end
end
