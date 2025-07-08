class UserMailer<ApplicationMailer
  default from: "nnotifications@example.com"
  def welcome_email
    @user= params[:user]
    @url="http://example.com/login"
    mail(to: @user.email_address, subject: "Welcome to my Awesome Site")
  end
end
