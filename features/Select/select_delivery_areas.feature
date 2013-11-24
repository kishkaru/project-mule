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
Then I should see "Let's get started! Where are you?"
And I should see "Please select an Area"
And I should see "Cory"
And I should see "Evans"
And I should see "Soda"



Scenario: Specifying an area near the customer
Given I am on the homepage
When I select "Cory" from "customer_area_id"
When I press "Update"
Then I should see "Select Delivery Point"
Then I should see "Please select a Delivery Point"


