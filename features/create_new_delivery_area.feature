Feature: create a new DeliveryArea to be stored in the database

  As an admin
  So that I can tell Servers exactly where the DeliverPoints are
  I want to store a DeliveryArea in the database

 
 Scenario: get form to create new DeliveryArea
   Given I am on the Listing delivery_areas page
   And I follow "New Delivery area"
   Then I should be on the New delivery_area page
 
Scenario: create a new delivery area
   Given I am on the New delivery_area page
   When I fill in "Name" with "Mission"
   And I press "Create Delivery area"
   Then I should see "Delivery area was successfully created."
   When I follow "Back"
   Then I should be on the Listing delivery_areas page
   And I should see "Mission"

 Scenario: fail to create delivery area
   Given I am on the New delivery_area page
   When I fill in "Name" with ""
   And I press "Create Delivery area"
   Then I should see "Name can't be blank"
 

 
