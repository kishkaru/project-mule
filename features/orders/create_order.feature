Feature: create an order

  As a customer
  So that I can purchase food
  I want to be able to turn my cart into an order

  Background:
    Given the following items exist:
    | name                | vendor   | price | description  | quantity | expires_at |
    | Regular Burrito     | Chipotle |  2.50 | the usual    |       55 | 30/6/2020  |
    | Spicy Burrito       | Chipotle |  3.50 | on fire      |       91 | 3/3/2014   |
    | Carne Asada Burrito | Chipotle |  5.50 | roasted beef |        2 | 12/3/1976  |
    And I have added the following items to my cart:
    | name            | qty |
    | Regular Burrito |   2 |
    | Spicy Burrito   |   2 |
    And a non admin account is set up

  Scenario: Checkout while logged out
    Given I am not logged in
    When I press "Purchase"
    Then the "How would you like to checkout?" pop-up should appear
    When I enter in user credentials
    And I press "Login"
    Then I should be on the order confirmation page
    When I press "Confirm"
    Then I should be on the order receipt page

  Scenario: Checkout while logged in
    Given I am logged in with a user account
    When I press "Purchase"
    Then I should be on the order confirmation page
    When I press "Confirm"
    Then I should be on the order receipt page
