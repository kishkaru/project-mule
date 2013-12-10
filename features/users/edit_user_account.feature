Feature: Edit user account

	As a customer
	So that I can update my information that changes
	I want to edit my account information

	Scenario: Edit account info
	Given a non admin account is set up
        And I am logged in with a user account
        And I am on the edit user page
        And I fill in "First name" with "Dwayne"
        And I fill in "Last name" with "Johnson"
        And I fill in "Current password" with "bbbbbbbb"
        And I press "Update"
        Then I should see "Dwayne"
        And I should see "Johnson"