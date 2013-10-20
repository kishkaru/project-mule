Feature: see all items

	As an admin
	So that I know what food Items we offer
	I want to see a list of all the Items

Background: items have been added to the database

	Given the following items exist:
	| name | description | price | ingredients | vendor |
	| Regular_Burrito | the usual | $2.50 | rice, beans | la_buritta |
	| Spicy_Burrito | your tongue, on fire | $3.50 | chile porblano, jalapenos | la_buritta |
	| Carne_Asada_Burrito | roasted beef | $5.50 | carne asada, cheese, beans | la_buritta |

	And I am on the all_items page

Scenario: successfully see all items
	Then I should see the following items: Regular_Burrito, Spicy_Burrito, Carne_Asada_Burrito

