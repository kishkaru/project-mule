class VendorMailer < ActionMailer::Base
  default from: "from@example.com"

  def email_vendors(order)
    email_list = Array.new
    order.vendors.each do |vendor|
      email_list << vendor.email
    end

    mail(to: email_list, subject: "Order summary for 10/12/13")
  end

end
