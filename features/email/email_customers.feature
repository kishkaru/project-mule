Feature: send the customers a pickup notice

  As a server
  So that customers can pick up their food
  I want to send them emails when food is ready for pickup

  Scenario: successfully send emails to customers for order pickup
    Given the following Order exist:
      | name    |
      | 11/12/13  |

    Given I am on the daily_order_summary page
    And I press "UC Berkeley Campus"
    Then I should be on the Delivery Point page for "UC Berkeley Campus"
    When I press "Email Customers"
    Then I should see "Emails successfully sent"
    And I should be on the Delivery Point page for "UC Berkeley Campus"

  Scenario: failed to send emails to customers

    Given I am on the daily_order_summary page
    And I press "UC Berkeley Campus"
    Then I should be on the Delivery Point page for "UC Berkeley Campus"
    When I press "Email Customers"
    Then I should see "Error sending emails"
    And I should be on the Delivery Point page for "UC Berkeley Campus"