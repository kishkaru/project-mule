class VendorMailer < ActionMailer::Base
  default from: "from@example.com"

  def email_vendors(order)
    @order = order

    email_list = Array.new
    order.vendors.each do |vendor|
      email_list << vendor.email
    end

    mail(to: email_list, subject: "Order summary for #{order.created_at}")
  end

end
