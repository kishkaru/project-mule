Feature: create a new DeliveryPoint to  be stored in the database

	As an admin
	So that I can tell Customers exactly where to pick up their food
	I want to store a DeliveryPoint in the database

Background:
    Given the admin account is set up
    And I am logged in with an admin account

Scenario: get form to create new DeliveryPoint
	Given I am on the Listing delivery_points page
	When I follow "New Delivery point"
	Then I should be on the new_delivery_point page

Scenario: fail to create delivery point
	Given I am on the new_delivery_point page
    And I press "Create Delivery point"
    Then I should see "Address city can't be blank"

Scenario: create a new delivery point
	Given I am on the new_delivery_point page
	And I fill in "Line1" with "1010 Computer Science Way"
	And I fill in "City" with "Berkeley"
    And I select "CA" from "State"
	And I fill in "Zip" with "11111"
    And I press "Create Delivery point"
	Then I should see "Delivery point was successfully created."
    And I should see "1010 Computer Science Way Berkeley, CA 11111"



