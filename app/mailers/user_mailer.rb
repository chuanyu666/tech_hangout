class UserMailer < ApplicationMailer
  default from: 'welcome@techhangout.org'
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome')
  end
end
