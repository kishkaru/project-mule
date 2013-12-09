Feature: chagne default credit card

	As a customer
	So that I can pay with different credit cards
	I want to change my default credit card

	@javascript
	Scenario: Change default card
    	Given a user is logged in and has the following credit cards set up:
    	| number | exp_date |
    	| 4111111111111111 | 12/2020 |
    	| 4005519200000004 | 12/2020 |
    	And I follow "Make default" and confirm
    	Then I should be on the edit credit cards page
    	And the card ending in "0004" should be the default card