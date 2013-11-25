Feature: Choose a delivery point for checkout process

As a customer
So that I can get food delivered closer to me
I want to choose a convinient delivery point from the delivery areas I can choose

Background: the following delivery areas have been added to the database

	Given the following Delivery Points exist:
	
	| address| latitude| longitude| id|
	| 2650 Durant Ave, Berkeley, CA, 11111 | 15.7 | 45.6 | 1|
	| 2521 Hearst Ave, Berkeley, CA, 11111 | 26.3 | 76.7 | 2|

	And the following DeliveryAreas exist:
	   |name|
	   |F&M District|
	   |Berkeley|
	   |Mission|
 	And I am on the home page

Scenario: Listing delivery points in an area
When I select "Berkeley" from "customer_area_id"
When I press "Update"
Then I should see "Select Delivery Point"

Scenario: Drop-Down
Given I select "Mission" from "customer_area_id"
And I press "Update"
Then I should see "Select Delivery Point"
And I should see "Please select a Delivery Point"
