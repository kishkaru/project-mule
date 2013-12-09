class AdminMailer < ActionMailer::Base
  default to: "projmule@gmail.com"
  default from: "projmule@gmail.com"

  def new_registration(user)
    @user = user
    mail(subject: "New User Signup: #{@user.email}")
  end

end
