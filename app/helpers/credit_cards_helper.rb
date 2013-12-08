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
			:options => {
				:make_default => default
				}
			)
	end

	# Sets default card to the credit card with id CC_ID for the user
	# with id ID
	def setDefaultCC(id, cc_id)
		user = User.find(id)
		new_default_card = CreditCard.find(cc_id)

		result = Braintree::CreditCard.update(
		  new_default_card.token,
		  :options => {
		    :make_default => true
		  }
		)

		if result.success?
			old_default_card = user.defaultCreditCard
			old_default_card.update_attribute(:default, false) unless !old_default_card
			new_default_card.update_attribute(:default, true)
		else
			puts result.errors
		end
	end

end