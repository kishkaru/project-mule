Feature: send the vendors an order summary

  As an admin
  So I can tell the vendors how much food to make
  I want to send the vendors an email with order totals

  Scenario: successfully send an email to the vendors with order summary
    Given the following Order exist:
      | name    |
      | 11/12/13  |

    Given I am on the daily_order_summary page
    And I press "Email Vendors"
    Then I should see "Emails successfully sent"
    And I should be on the daily_order_summary page

  Scenario: failed to send emails to vendors

    Given I am on the daily_order_summary page
    And I press "Email Vendors"
    Then I should see "Error sending emails"
    And I should be on the daily_order_summary page