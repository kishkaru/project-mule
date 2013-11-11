Feature: create an item
  
  As an admin
  So that I can different Items to different Menus
  I want a database of items

  Scenario: create an item

    Given I am on the items page
    And I follow "New Item"
    And I fill in "item_name" with "Orange Chicken"
    And I fill in "item_price" with "5.99"
    And I fill in "item_description" with "chicken, egg, salt, garlic"
    And I fill in "item_quantity" with "1"
    And I press "Create Item"
    Then I should be on the item page for "Orange Chicken" 
    And I should see "Orange Chicken"
    And I should see "5.99"
    And I should see "chicken, egg, salt, garlic"
