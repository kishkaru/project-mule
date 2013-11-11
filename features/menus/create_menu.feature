Feature: Create a new Menu to be stored in the database

	As an admin
	So that I can assign Menus to specific DeliveryAreas for certain dates
	I want to store a Menu in the database

  Scenario: Create new menu
    Given I am on the home page
    When I follow "Create Menu"
    Then a "#create-menu" modal should appear
    When I select "Blank Menu" in "#create-menu"
    And I press "Create"
    Then I should be on the Show Menu page
