Feature: create a new DeliveryArea to be stored in the database

  As an admin
  So that I can tell Servers exactly where the DeliverPoints are
  I want to store a DeliveryArea in the database

 Background:
   Given the following DeliveryPoints exist:
   |name|server|menu|delivery_points|
   |Financial District|James| empty menu| Market St & Beale St, San Francisco, 14th and Perez St, San Francisco
   |Mission District| Paul|chicken&rice| 14th St and Dolores, San Francisco, Powell and Martin, San Francisco

 
 Scenario: get form to create new DeliveryArea
   Given I am on the all_delivery_points page
   And I follow "new_delivery_area"
   Then I should be on the new_delivery_area page
 
Scenario: create a new delivery area
   Given I am on the new_delivery_area page
   I should see (Financial District, Mission District)
   When I select 'Financial District' from DeliverPoints
   And I follow "Save"
   Then I should be on the Delivery_Area page
   And I should see "Financial District James empty menu Market St & Beale St, San Francisco, 14th and Perez St, San Francisco"
   And I should not see "Mission District Paul chicken&rice 14th St and Dolores, San Francisco, Powell and Martin, San Francisco"


 Scenario: fail to create delivery area
   Given I am on the new_delivery_area page
   When I select '' from DeliverPoints
   And I follow "Save"
   Then I should see "Error: No points specified"
 

 
