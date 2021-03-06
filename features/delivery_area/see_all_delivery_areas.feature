  Feature: create a new AllDeliveryAreas to be stored in the database
 
As an admin
So that I know every area that a customers can order food from
I want to see a list of all DeliveryAreas

Background:
    Given the admin account is set up
    And I am logged in with an admin account
 
Scenario: successfully see all areas
   Given the following DeliveryAreas exist:
	   |name|
	   |F&M District|
	   |Berkeley|
	   |Mission|

   And I am on the Listing delivery_areas page
   Then I should see "F&M District"
   And I should see "Berkeley"
   And I should see "Mission"

Scenario: successfully delete a Delivery Area

   Given the following DeliveryAreas exist:
	   |name|
	   |F&M District|
   And I am on the Listing delivery_areas page
   When I follow "Destroy"
   And I should not see "F&M District"
