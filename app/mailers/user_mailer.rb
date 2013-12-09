class UserMailer < ActionMailer::Base
  default from: "projmule@gmail.com"

  def welcome_email(user)
    @user = user
    email_with_name = "#{@user.first_name} #{@user.last_name} <#{@user.email}>"
    @url  = "http://localhost:3000/users/sign_in"
    mail(to: email_with_name, subject: 'Welcome to ProjectMule!')
  end

  def order_confirmation(order, user)
    @user = user
    @email = @user.email

    mail(to: @email, subject: "Order confirmation")
  end

  def order_ready(order)
    email_list = Array.new
    order.customers.each do |customer|
      email_list << customer.email
    end

    mail(to: email_list, subject: "Your food is ready for pickup!")
  end

end
