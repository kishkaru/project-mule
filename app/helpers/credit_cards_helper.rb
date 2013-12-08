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
	# using the boolean DEFAULT for USER and returns the result
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

	# Sets default card to NEW_DEFAULT_CARD for the USER
	def setDefaultCC(user, new_default_card)
		if !new_default_card.default
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
				user.credit_cards(true)
			else
				puts result.errors
			end
		end

	end

	# Takes the braintree stored CREDIT_CARD and creates the credit card
	# in the local database and associates it with USER. Can specify if
	# card should be the DEFAULT card. Returns the CreditCard
	def associateStoredCreditCard(credit_card, user, default)
		new_cc = CreditCard.create!(:token => credit_card.token,
            :last_four => credit_card.last_4,
            :default => default,
            :type_image_url => credit_card.image_url)
        user.credit_cards << new_cc
        return new_cc
	end

	# Checks if CREDIT_CARD_UINIQ_ID is already stored in the vault for USER_TOKEN
	# in braintree. Returns true if in vault already
	def alreadyInVault(credit_card_uniq_id, user_token)
		customer = Braintree::Customer.find(user_token)
		count = 0
		customer.credit_cards.each do |cc|
			if cc.unique_number_identifier == credit_card_uniq_id
				count += 1
			end

			if count > 1
				return true
			end
		end

		return false
	end

end