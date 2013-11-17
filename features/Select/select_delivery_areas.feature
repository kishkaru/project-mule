Feature: Choose a Delivery Area for checkout process

As a customer
So that I can get food delivered closer to me
I want to choose a delivery area that is closest to me from all my choices

Background: the following delivery areas have been added to the database
	
	Given the following delivery areas exist:
	| delivery area | delivery points |
	| Area A | Point A, Point B, Point C |

Scenario: Listing locations on the homepage
Given I am on the home page
Then I should view "Select an Area near you"
And I should see "Area A"
And I should see "Area B"

Scenario: Specifying an area near the customer
Given I am on the homepage
Then I should view "Area A"
When I press "Area A"
Then I should see "Choose a pick-up spot"  
Then I should be on the delivery points page for "Area A"

Scenario: Customer can choose a pick-up spot to view menu from 
Given I am on the delivery points page for "Area A"
Then I should see "Point A"
And I should see "Point B"
And I should see "Point C"
When I follow "Point B"
Then I should see "What to eat?"

