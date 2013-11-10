Feature: see all the items
  
  As an admin
  So I can add items to menus
  I want to see all possible items

  Background:
    Given the following items exist 
    | name | price | description | quantity | expires_at | 
    | Cheese Pizza    | 6.99 | Cheese, Garlic, Bread | 2 | 11/12/14 | 
    | Latte   |   | Milk, Sugar | 3 | 11/14/15 |
    | Green Salad | 0.99 | Lettuce | 1 | 10/12/13 | 

  Scenario: admin should see all items 

  Given I am on the show items page
  Then I should see "Cheese Pizza"
  And I should see "Latte"
  And I should see "Green Salad"
  And I should see "6.99"
  And I should see "0.99"
  And I should see "Cheese, Garlic, Bread"
  And I should see "Milk, Sugar"
  And I should see "Lettuce"




