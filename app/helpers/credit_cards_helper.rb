module CreditCardsHelper

	# Create customer in braintree if USER does not exist in vault
	def createUserInVault(user)
		if !user.braintree_token.present?
			user_result = Braintree::Customer.create(
				:first_name => user.first_name,
				:last_name => user.last_name,
				:email => user.email,
				:phone => user.phone_number.braintreeString
				)
			if user_result.success?
				user.update_attribute(:braintree_token, user_result.customer.id)
				puts user.braintree_token
			else
				puts user_result.errors
			end
		end
	end

	# Create the credit card in the vault using CC_ATTRS and sets it to default
	# using the boolean DEFAULT for USER
	def createCreditCardInVault(cc_attrs, default, user)
		credit_card_result = Braintree::CreditCard.create(
			:customer_id => user.braintree_token,
			:number => cc_attrs[:card_number],
			:expiration_date => cc_attrs[:exp_date],
			:cvv => cc_attrs[:cvv],
			:options => {
				:fail_on_duplicate_payment_method => true,
				:make_default => default
				}
			)
	end

end