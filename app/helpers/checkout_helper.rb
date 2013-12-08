module CheckoutHelper

	# Make a Braintree transaction with USER's default credit card
	# for a charge of AMOUNT dollars and returns the result
	def braintreeTransactionWithDefault(user, amount)
		result = Braintree::Transaction.sale(
                  :customer_id => user.braintree_token,
                  :amount => amount.round(2).to_s
                )
	end

	# Creates and saves the order for USER using ITEMS
	# and the braintree transaction result RESULT
	def createOrder(user, items, result)
		new_order = Order.create_with_items(items)
        new_order.user = user
        new_order.transaction_id = result.transaction.id
        new_order.save!
	end

end