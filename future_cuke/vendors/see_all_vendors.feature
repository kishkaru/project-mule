Feature: see all the vendors

  As an admin
  So that I know which Vendors I am offering food from
  I want to see a list of all my Vendors

  Background:
    Given the following vendors exist
    | name | email | address | 
    | Chiptole    | buro@chiptole.com | 111-111-1111 | 
    | Starbucks   | c@b.com |              |  
    | Cheeseboard | d@b.com | 222-222-2222 | 
    | Chutneys    | d@s.com | 333-333-3333 |

  Scenario: admin should see all vendors
  Given I am on the show vendors page 
  Then I should see "Chiptole"
  And I should see "Starbucks"
  And I should see "Cheeseboard"
  And I should see "Chutneys"
  And I should see "111-111-1111"
  And I should see "222-222-2222"
  And I should see "333-333-3333"
  And I should see "c@b.com"
  And I should see "d@b.com"
  And I should see "d@s.com"



