Feature: As an admin
          So that I can organize items
          I want to be assigned full control over its creation

Background:
        Given the admin account is set up
        And I am logged in with an admin account
        And the following items exist:
    | name                | vendor   | price | description  | quantity | expires_at |
    | Regular_Burrito     | Chipotle | $2.50 | the usual    |       55 | 30/6/2020  |
    | Spicy_Burrito       | Chipotle | $3.50 | on fire      |       91 | 3/3/2014   |
    | Carne_Asada_Burrito | Chipotle | $5.50 | roasted beef |        2 | 12/3/1976  |   

Scenario: Admin can see options to create, edit, show and delete an item

Given I am on the all_items page
Then I should see "Listing items"
And I should see "Show"
And I should see "Edit"
And I should see "Destroy"
And I should see "New Item"

Scenario: Admin can view an item
Given I am on the all_items page
When I follow "Show" for "Regular_Burrito"
Then I should see "Name: Regular_Burrito"
And I should see "Price: $2.50"

Scenario: Admin can edit a items
Given I am on the all_items page
And I follow "Edit" for "Regular_Burrito"
Then I should see "Name"
And I should see "Add Ingredient"
And I should see "Create Ingredient"
And I should see "Update item"

Scenario: Admin can destroy an ingredient
Given I am on the all_items page
And I follow "Destroy" for "Regular_Burrito"
When I confirm popup
And I am on the all_items page
Then I should not see "Regular_Burrito"

Scenario: Admin can create an item
Given I am on the all_items page
Then I should see "New item"

