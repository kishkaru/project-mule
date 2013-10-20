Feature: create a new vendor to be stored in the database

	As an admin
	So that I can add Items to different Menus
	I want to store an Item in the database

Scenario: get form to create new vendor
  Given I am on the vendors page
  And I press "new_vendor"
  Then I should be on the create vendor Page

Scenario: create a new vendor
  Given I am on the create vendor page
  And I fill in the following information:
  | name | phone_number | address                                |
  | Ikes | 123-456-7890 | 1234 56th St. San Francisco, Ca, 12345 |

  And I press "Save"
  Then I should be on the vendors page
  And I should see "Ikes"
