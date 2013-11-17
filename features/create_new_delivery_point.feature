Feature: create a new DeliveryPoint to  be stored in the database

	As an admin
	So that I can tell Customers exactly where to pick up their food
	I want to store a DeliveryPoint in the database

Scenario: get form to create new DeliveryPoint
	Given I am on the Listing delivery_points page
	When I follow "New Delivery point"
	Then I should be on the new_delivery_point page

Scenario: fail to create delivery point
	Given I am on the new_delivery_point page
	When I fill in "Address" with "2345 Sunset Blvd"
	And I fill in "Latitude" with "56.5"
	And I press "Create Delivery point"
	Then I should see "Longitude can't be blank"

Scenario: create a new delivery point
	Given I am on the new_delivery_point page
	And I fill in "Address" with "1010 Computer Science Way 11000 Berkeley, CA"
	And I fill in "Latitude" with "56.6"
        And I fill in "Longitude" with "34.6"
	And I press "Create Delivery point"
	Then I should see "Delivery point was successfully created."
	When I follow "Back"
	Then I should be on the Listing delivery_points page
        And I should see "1010 Computer Science Way 11000 Berkeley, CA 56.6 34.6"
	

