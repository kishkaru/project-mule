  Feature: create a new AllDeliveryAreas to be stored in the database
 
As an admin
So that I know every area that a customers can order food from
I want to see a list of all DeliveryAreas
 
 Background:
   Given the following DeliveryAreas exist:
   |name|menu|customers|
   |F&M District|empty menu| and chicken&rice | Susie, Sally
   |Berkeley|rice&eggs, tofu | Joe, John

And I am on the all_delivery_areas page

Scenario: successfully see all areas
Then I should see the following area names: F&M District, Berkeley

Scenario: successfully delete a Delivery Area
   When I select 'F&M District'
   And I follow "Delete"
   Then I should see an "Alert: Are you sure you want to delete?"
   And I follow "Yes"
   Then I should be on the DeliveryArea page
   And I should see 'Mission District'
   And I should see "Delivery Area successfully deleted"
   And I should not see "Financial District"
