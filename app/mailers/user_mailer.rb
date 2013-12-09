class UserMailer < ActionMailer::Base
  default from: "projmule@gmail.com"

  def welcome_email(user)
    @user = user
    email_with_name = "#{@user.first_name} #{@user.last_name} <#{@user.email}>"
    @url  = "http://projectmule.herokuapp.com/users/sign_in"
    mail(to: email_with_name, subject: 'Welcome to LuckyBolt!')
  end

  def order_confirmation(order, transaction)
    @order = order
    @transaction = transaction
    @user = @order.user
    @items = @order.item_orders
    email_with_name = "#{@user.first_name} #{@user.last_name} <#{@user.email}>"

    mail(to: email_with_name, subject: "Order Confirmation #{@order.created_at}")
  end

  def order_ready(order)
    @order = order

    email_list = Array.new
    order.customers.each do |customer|
      email_list << customer.email
    end

    mail(to: email_list, subject: "Your food is ready for pickup!")
  end

end
