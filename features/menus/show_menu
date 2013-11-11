Feature: Show a menu to customers

    As an customer
    So that I can order food
    I want to view a menu

  Background:
    Given a menu with the following items:
      | name    | price | description             | quantity | expires_at |
      | Pasta   |     8 | Penne with tomato sauce |       10 |         12 |
      | Chicken |     9 | Chicken in Gravy        |        9 |         12 |
      | Ribs    |    10 | Ribs in BBQ Sauce       |        0 |         12 |

  Scenario: Visiting the menu page
    Given I am viewing the menu
    Then I should see "Pasta"
    And I should see "Chicken"
    And I should see "Ribs"

  Scenario: Add an in-stock item to cart
    Given I am viewing the menu
    When I click "Add to Cart" for row "Chicken"
    Then I should have "Chicken" in my cart

  Scenario: Can't add an out-of-stock item to cart
    Given I am viewing the menu
    Then I should not be able to click "Add to Cart" for row "Ribs"
