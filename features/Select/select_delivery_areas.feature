Feature: Choose a Delivery Area for checkout process

As a customer
So that I can get food delivered closer to me
I want to choose a delivery area that is closest to me from all my choices

Background: the following delivery areas have been added to the database
	
	Given the following DeliveryAreas exist:
	| name | 
	| Cory |
	| Evans|
	| Soda |

Scenario: Listing locations on the homepage
Given I am on the home page
Then I should see "Area"



