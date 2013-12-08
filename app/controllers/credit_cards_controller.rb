class CreditCardsController < ApplicationController
	include CreditCardsHelper

	before_filter :user_logged_in

	def index
		@editing = true
	end

	def new
	end

	def create
		user = User.find(current_user.id)

		createUserInVault(user)

		# Check if this is the first credit card to decide if it should be set as default
		default = false
		if user.credit_cards.length == 0
			default = true
		end

		credit_card_to_add = params[:credit_card]

		credit_card_result = createCreditCardInVault(credit_card_to_add, default, user)

		if credit_card_result.success?
			# Create credit card local object and associate with user
			cc_to_add = CreditCard.create!(:token => credit_card_result.credit_card.token,
				:last_four => credit_card_result.credit_card.last_4,
				:default => default)
			user.credit_cards << cc_to_add
			flash[:success] = 'Credit card was added successfully'

			redirect_to edit_credit_cards_path
		else
			@cc_errors = credit_card_result.errors
			render 'new'
		end

	end

	def destroy
		cc = CreditCard.find(params[:id])
		user = User.find(current_user.id)

		if user.credit_cards.delete(cc)
			cc.destroy
			Braintree::CreditCard.delete(cc.token)
			flash[:success] = "Credit card ending in #{cc.last_four} deleted successfully"

			user_credit_cards = user.credit_cards
			if user_credit_cards.present?
				user_credit_cards.first.update_attribute(:default, true)
			end

			redirect_to edit_credit_cards_path
		end
	end

	# Sets the credit card with id params[:id] to the current users default credit card
	def setDefault
		user = User.find(current_user.id)
		new_default_card = CreditCard.find(params[:cc_id])

		result = Braintree::CreditCard.update(
		  new_default_card.token,
		  :options => {
		    :make_default => true
		  }
		)

		if result.success?
			old_default_card = user.defaultCreditCard
			old_default_card.update_attribute(:default, false)
			new_default_card.update_attribute(:default, true)
		else
			puts result.errors
		end

		redirect_to edit_credit_cards_path
	end

end