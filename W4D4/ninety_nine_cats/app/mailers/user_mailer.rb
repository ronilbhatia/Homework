class UserMailer < ApplicationMailer
  default from: "everybody@appacademy.io"

  def welcome_email(user)
    @user = user
    mail(to: 'ronilbhatia@gmail.com', subject: 'Welcome to App Academy!')
  end
end
