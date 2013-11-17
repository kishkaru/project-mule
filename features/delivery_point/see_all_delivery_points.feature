Feature: see all items

	As an admin
	So that I can know every location where Customers can pick up food
	I want to see a list of all DeliveryPoints

Background: items have been added to database

    Given the following delivery_points exist:
    | address               | lattitude | longtitude | delivery_area |
    | 2650_Durant_Ave_94704 |      15.7 |       45.6 | Unit_1        |
    | 2521_Hearst_Ave_94704 |      26.3 |       76.7 | Soda          |
    | 2727_Dwight_Way_94704 |      32.2 |       23.3 | G_house       |

	And I am on the all_delivery_points page

Scenario: successfully see all delivery points
	Given I am on the Home page
	And I follow Delivery Points	
	Then I should see the following delivery points: (2650_Durant_Ave_94704, Unit_1), (2521_Hearst_Ave_94704, Soda Hall), (2727_Dwight_Way_94704, G_House)


Scenario: delete a delivery point
       Given I am on the Delivery_Points page
       When I select "Soda"
       And I press "Delete"
       Then I should see "Alert: Are you sure you want to delete?"
       And I follow "Yes"
       Then I should see "Delivery point successfully deleted"
       And I should see (Unit_1, G_House)
       And I should not see (Soda)
