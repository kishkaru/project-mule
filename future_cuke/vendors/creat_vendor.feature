Feature: create a vendor

  As an admin
  So that I can add a menu to a vendor
  I want a database of vendors

  Scenario: create a vendor
    Given I am on the show vendors page
    And I follow "New Vendor"
    And I fill in "vendor_name" with "Chiptole" 
    And I fill in "vendor_address" with "1234"
    And I fill in "vendor_email" with "bandito@chipotle.com"
    And I press "Create Vendor"
    Then I should be on the vendor page for "Chiptole"
    And I should see "Chiptole"    
    And I should see "Chiptole"
    And I should see "bandito@chipotle.com"
    And I should see "1234"
