# Preview all emails at http://localhost:3000/rails/mailers/like_mailer
class LikeMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/like_mailer/like_created
  def like_created
    LikeMailer.with(user:User.first, like: Like.find_by('1')).like_created
  end

end
