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
        | Avacado |     

Scenario: Admin can see options to create, edit, show and delete an ingredient

Given I am on the all_ingredients page
Then I should see "Listing ingredients"
And I should see "Show"
And I should see "Edit"
And I should see "Destroy"
And I should see "New Ingredient"

Scenario: Admin can view an ingredient
Given I am on the all_ingredients page
And I follow "Show" for "Cheese"
Then I should see "Name: Cheese"

Scenario: Admin can edit a ingredients
Given I am on the all_ingredients page
And I follow "Edit" for "Cheese"
Then I should see "Name"
And I should see "Update Ingredient"

Scenario: Admin can destroy an ingredient
Given I am on the all_ingredients page
And I follow "Destroy" for "Cheese"
When I confirm popup
And I am on the all_ingredients page
Then I should not see "Cheese"

Scenario: Admin can create an ingredient
Given I am on the all_ingredients page
Then I should see "New Ingredient"

