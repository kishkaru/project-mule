Feature: see all vendors

  As an admin
  So that I know which Vendors I am offering food from
  I want to see a list of all my Vendors

  Background: Vendors have been added to the database

    Given the following vendors exist:
      | name        | phone number | email                | address                                         |
      | Chipotle    | 111-111-1111 | buro@chipotle.com    | 1234 Maple Street, Suite 110, Berkeley CA 94704 |
      | La Buritta  | 222-222-2222 | churro@laburitta.com | 4321 Grape Avenue, Suite 1, Berkeley CA 94709   |
      | Cheeseboard | 333-333-3333 | duro@cheeseboard.com | 987 Oak Way, Berkeley 94705                     |

    And I am on the all_vendors page

  Scenario: successfully see all Vendors
    Then I should see all the Vendors
