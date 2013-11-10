Feature: Create a new Menu to be stored in the database

	As an admin
	So that I can assign Menus to specific DeliveryAreas for certain dates
	I want to store a Menu in the database

  Scenario: get form to create new menu
    Given I am on the "home_page"
    When I press "create_menu"
    Then a "choose_template" modal should appear
    When I select "Blank Menu"
    And I press "Create"
    Then I should be on the "Edit Menu" page
