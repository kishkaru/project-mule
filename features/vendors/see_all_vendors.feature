Feature: see all vendors

  As an admin
  So that I know which Vendors I am offering food from
  I want to see a list of all my Vendors

  Background: Vendors have been added to the database

    Given the following vendors exist:
      | name        | email                | address                                |
      | Chipotle    | buro@chipotle.com    | 1234 Maple Street, Berkeley, CA, 94704 |
      | La Buritta  | churro@laburitta.com | 4321 Grape Avenue, Berkeley, CA, 94709 |
      | Cheeseboard | duro@cheeseboard.com | 987 Oak Way, Berkeley, CA, 94705       |

    And the admin account is set up
    And I am logged in with an admin account
    And I am on the all_vendors page

  Scenario: successfully see all Vendors
    Then I should see "Chipotle"
    And I should see "La Buritta"
    And I should see "Cheeseboard"
    And I should see "buro@chipotle.com"
    And I should see "churro@laburitta.com"
    And I should see "duro@cheeseboard.com"
    And I should see "1234 Maple Street Berkeley, CA 94704"
    And I should see "4321 Grape Avenue Berkeley, CA 94709"
    And I should see "987 Oak Way Berkeley, CA 94705"
