Feature: Show a menu to customers

    As a customer
    So that I can order food
    I want to view a menu

  Background:
    Given a blank menu
    And the following item templates exist:
      | name    | price | description             |
      | Pasta   |     8 | Penne with tomato sauce |
      | Chicken |     9 | Chicken in Gravy        |
      | Ribs    |    10 | Ribs in BBQ Sauce       |
    And the following delivery areas exist:
      | name | delivery_points                     |
      | SoMa | 2nd & Brannan, Montgomery & Brannan |

  Scenario: Adding items to menu
    Given I am editing the menu
    When I enter "Chicken" into "Add Item To Menu"
    And I enter "10" into "Add Item Quantity"
    And I enter "12:00" into "Add Item Expiration"
    And I press "Add Item"
    Then I should be editing the menu
    And the menu should have "Chicken"

  Scenario: Failing to add items to menu
    Given I am editing the menu
    When I enter "Chicken" into "Add Item To Menu"
    And I enter "10" into "Add Item Quantity"
    And I press "Add Item"
    Then I should see error "Please enter an expiration time"

  Scenario: Adding a Delivery Area
    Given I am editing the menu
    When I enter "SoMa" into "Add Delivery Area"
    And I press "Add" in "Add Delivery Area"
    Then menu should have "1" Delivery Area
