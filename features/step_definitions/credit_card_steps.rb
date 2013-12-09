Given /a user is logged in and has the following credit cards set up/ do |credit_card_table|
	step %{Given a non admin account is set up}
	step %{And I am logged in with a user account}
	credit_card_table.hashes.each do |card|
		step %{I am on the add new credit card page}
    	step %{I fill in "credit_card_card_number" with "#{card['number']}"}
    	step %{I fill in "credit_card_exp_date" with "#{card['exp_date']}"}
    	step %{I press "Add card"}
    end
end

Then /the card ending in "(.*)" should be the default card/ do |last_four|
	CreditCard.find_by_last_four(last_four).default.should == true
end