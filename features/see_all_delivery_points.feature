Feature: see all items

	As an admin
	So that I can know every location where Customers can pick up food
	I want to see a list of all DeliveryPoints

Background: items have been added to database

	Given the following items exist:
	| name | nickname_and_nearest_address | stop_number| estimated_time |
	| Ryan_Quan | (Unit_1, 2650_Durant_Ave_94704) | 1 | 12:00 PM |
	| Ryan_Higgins | (Soda_Hall, 2521_Hearst_Ave_94704) | 2 | 1:00 PM |
	| Rick_Bhardwaj | (G_House, 2727_Dwight_Way_94704) | 3 | 2:00 PM |

	And I am on the all_delivery_points page

Scenario: successfully see all delivery points
	Then I should see the following delivery points: (Unit_1, 2650_Durant_Ave_94704), (Soda_Hall, 2521_Hearst_Ave_94704), (G_House, 2727_Dwight_Way_94704)
