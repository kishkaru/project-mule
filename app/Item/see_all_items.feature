Feature: see all items

	As an admin
	So that I know what food Items we offer
	I want to see a list of all the Items

Background: items have been added to the database

	Given the following items exist:
	| name | price | description | quantity | expires_at |
	| Regular_Burrito | $2.50 | the usual | 55 | 6/30/2020 |
	| Spicy_Burrito | $3.50 | your tongue, on fire | 91 | 3/3/2014 |
	| Carne_Asada_Burrito | $5.50 | roasted beef | 2 | 12/3/1976 |

	And I am on the all_items page

Scenario: successfully see all items
	Then I should see all the items

