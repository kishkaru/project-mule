class CreditCardsController < ApplicationController

	before_filter :user_logged_in

	def index
		@allow_delete = true
	end

	def new
	end

	def create
		user = User.find(current_user.id)

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

		credit_card_to_add = params[:credit_card]

		credit_card_result = Braintree::CreditCard.create(
			:customer_id => user.braintree_token,
			:number => credit_card_to_add[:card_number],
			:expiration_date => credit_card_to_add[:exp_date],
			:cvv => credit_card_to_add[:cvv],
			:options => {
				:fail_on_duplicate_payment_method => true
				}
			)

		if credit_card_result.success?
			user.credit_cards << CreditCard.create(:token => credit_card_result.credit_card.token, :last_four => credit_card_result.credit_card.last_4)
			puts "!!!!!!!!!!!"
			puts "#{[user.credit_cards]}"
			flash[:success] = 'Credit card was added successfully'
			redirect_to edit_credit_cards_path
		else
			@cc_errors = credit_card_result.errors
			puts "#{[credit_card_result.errors]}"
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
			redirect_to edit_credit_cards_path
		end
	end

end