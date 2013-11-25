Feature: see all Delivery Points

	As an admin
	So that I can know every location where Customers can pick up food
	I want to see a list of all DeliveryPoints


Scenario: delete a delivery point
	Given the following Delivery Points exist:
		| address							   | latitude | longitude | id |
		| 2650 Durant Ave, Berkeley, CA, 10001 | 15.7     | 45.6      | 1  |
       	And I am on the Listing delivery_points page   
       	When I follow "Destroy"
       	Then I should not see "2650 Durant Ave 15.7 45.6"




Scenario: successfully see all delivery points

	Given I am on the Listing delivery_points page
	And the following Delivery Points exist:
	| address| latitude| longitude| id|
	| 2650 Durant Ave, Berkeley, CA, 12345 | 15.7 | 45.6 | 1|
	| 2521 Hearst Ave, Berkeley, CA, 12345 | 26.3 | 76.7 | 2|
	| 2727 Dwight Way, Berkeley, CA, 12345 | 32.2 | 23.3 | 3|

	And I am on the Listing delivery_points page	
	Then I should see "2650 Durant Ave Berkeley, CA 12345"
	And I should see "15.7"
	And I should see "45.6"
	And I should see "2521 Hearst Ave Berkeley, CA 12345"
	And I should see "26.3"
	And I should see "76.7"
    And I should see "2727 Dwight Way Berkeley, CA 12345"
    And I should see "32.2"
    And I should see "23.3"



