Feature: Choose a delivery point for checkout process

As a customer
So that I can get food delivered closer to me
I want to choose a convinient delivery point from the delivery areas I can choose

Background: the following delivery areas have been added to the database

	Given the following delivery areas exist:
	| delivery area | delivery points |
	| Area A | 1st Street, 2nd Steet|
	| Area B | 3rd Street |

Scenario: Listing delivery points in an area
Given I am on the home page
And I press "Area A"
Then I should see "Choose a pick-up spot"  
Then I should see "1st Street, 2nd Street"
Then I should be on the the delivery points page for "Area A"

Scenario: Customer can choose pick-up spot to view menus from
Given I am on the delivery points page for "Area B"
And I follow "Area B"
Then I should see "What to eat?"

