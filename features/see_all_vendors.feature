Feature: see all vendors

  As an admin
  So that I know which Vendors I am offering food from
  I want to see a list of all my Vendors

Background: vendors have been added to the database

  Given the following vendors exist:
  | name       | phone_number | address                                |
  | Chipotle   | 123-456-7890 | 1234 56th St. San Francisco, Ca, 12345 |
  | Ikes       | 123-456-7890 | 1234 56th St. San Francisco, Ca, 12345 |
  | El Farlito | 123-456-7890 | 1234 56th St. San Francisco, Ca, 12345 |

  And I am on the vendors page

Scenario: see all vendors
  Then I should see the following vendors: Chipotle, Ikes, El Farlito