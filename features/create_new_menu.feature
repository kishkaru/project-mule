Feature: Create a new Menu to be stored in the database

	As an admin
	So that I can assign Menus to specific DeliveryAreas for certain dates
	I want to store a Menu in the database

Background:
	Given the following Delivery Areas exist:
	| name               | server | menu       | delivery_points                               | customers         |
	| Financial District | James  | empty menu | Market St & Beale St, San Francisco, CA 94111 | Chad, Cory, Casey |


Scenario: get form to create new menu
	Given I am on the "home_page"
	And I press "create_menu"
	Then I should be on the "create_menu" page


Scenario: fail to select a delivery area
	Given I am on the "create_menu" page
	And I fill in "Date Available" with "11/11/2013"
	And I press "Save"
	Then I should see "Error: Delivery Area not selected"
	And I should be on the "create_menu" page


Scenario: fail to create items
	Given I am on the "create_menu" page
	And I fill in "Date Available" with "11/11/2013"
	And I select "Financial District" from "Delivery Area"
	And I press "Save"
	Then I should see "Error: No items were created"


Scenario: create a new menu
	Given I am on the "create_menu" page
	And I fill in "Date Available" with "11/11/2013"
	And I select "Financial District" from "Delivery Area"
	And I fill in the following information:
	| item           |
	| The LGBT       |
	| The Bird       |
	| Sea Salted     |
	| Cracked Pepper |
	| Pure Green Tea |

	And I press "Save"
	Then I should be on the "financial_district" page
	And I should see "The LGBT"
	And I should see "The Bird"
	And I should see "Sea Salted"
	And I should see "Cracked Pepper"
	And I should see "Pure Green Tea"