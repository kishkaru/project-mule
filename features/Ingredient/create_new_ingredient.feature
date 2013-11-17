Feature: create a new ingredient to be stored in the database

	As an admin
	So that I can add Ingredients to different Items
	I want to store an Ingredient in the database

Scenario: get form to create new ingredient
	Given I am on the all_ingredients page
	And I follow "New Ingredient"
	Then I should be on the create_new_ingredient page

Scenario: successfully create a new ingredient
	Given I am on the create_new_ingredient page
	And I fill in "Name" with "Tomato"	
	And I press "Create Ingredient"
	Then I should see "Tomato"
	
Scenario: create a new ingredient: empty
    Given I am on the create_new_ingredient page
    And I press "Create Ingredient"
    Then I should be on the create_new_ingredient page
    And I should see "Error: empty fields!"
    And I should not be on the all_ingredients page
