module CheckoutHelper
  include SmsHelper

	# Make a Braintree transaction with USER's default credit card
	# for a charge of AMOUNT dollars and returns the result
	def braintreeTransactionWithDefault(user, amount)
		result = Braintree::Transaction.sale(
                  :customer_id => user.braintree_token,
                  :amount => amount.round(2).to_s
                )
	end

	# Creates and saves the order for USER using ITEMS
	# and the braintree transaction result RESULT. Returns
	# the order made. Also saves the chosen pickup point as the users
	# default pickup point. ITEMS is a hash of menu_items mapping to quantities
	def createOrder(user, items, result)
		new_order = Order.create_with_items(items)
        new_order.user = user
        new_order.transaction_id = result.transaction.id
        new_order.delivery_point = @current_point
        user.update_attribute(:pickup_point, @current_point)

        # Get the date for the order pick up
        delivery_date = items.keys.first.menu.date

        new_order.pickup_date = delivery_date

        new_order.save!
        return new_order
    end

    # Sends an email to the user who made the order ORDER
    def sendConfirmationEmail(order)
    transaction = Braintree::Transaction.find(order.transaction_id)
    UserMailer.order_confirmation(order, transaction).deliver
    #send_sms(order.user.phone_number.asString, "ProjectMule: Order confirmed! Total: #{view_context.number_to_currency(order.total)}")
    end

end
