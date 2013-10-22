Feature: create a new DeliveryPoint to  be stored in the database

	As an admin
	So that I can tell Customers exactly where to pick up their food
	I want to store a DeliveryPoint in the database

Background:
	Given the following Delivery Areas exist:
	|name|server|menu|delivery_points|customers|		
	|Financial District|James|empty menu| Market St & Beale St, San Francisco, CA 94111|Chad, Cory, Casey|

Scenario: get form to create new DeliveryPoint
	Given I am on the all_delivery_points page
	And I press "new_delivery_point"
	Then I should be on the "new_delivery_point" page

Scenario: fail to create delivery point
	Given I am on the "new_delivery_point" page
	And I fill in "Nickname" with "Union Square"
	And I press "Save"
	Then I should see "Error: No address specified"

Scenario: create a new delivery point
	Given I am on the "new_delivery_point" page
	And I fill in "Nickname" with "Soda Hall"
	And I fill in "Address" with "1010 Computer Science Way 11000 Berkeley, CA"
	And I press "Save"
	
	Then I should be on the "Delivery_Points" page
	And I should see "Soda Hall, 1010 Computer Science Way 11000 Berkeley, CA"
