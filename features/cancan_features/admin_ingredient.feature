Feature: As an admin
          So that I can organiza ingredients
          I want to be assigned full control over its creation

Background:
        Given the admin account is set up
        And I am logged in with an admin account
        And the following ingredients exist:
        | name | 
        | Tomato |
        | Cheese |
        | Avocado |     

Scenario: Admin can see options to create, edit, show and delete an ingredient

Given I am on the all_ingredients page
Then I should see "Listing ingredients"
And I should see "Show"
And I should see "Edit"
And I should see "Destroy"
And I should see "New Ingredient"

Scenario: Admin can view an ingredient
Given I am on the all_ingredients page
Then I should see "Cheese Show"

Scenario: Admin can edit a ingredients
Given I am on the all_ingredients page
Then I should see "Tomato Show Edit"


Scenario: Admin can destroy an ingredient
Given I am on the all_ingredients page
Then I should see "Avocado Show Edit Destroy"

Scenario: Admin can create an ingredient
Given I am on the all_ingredients page
Then I should see "New Ingredient"

