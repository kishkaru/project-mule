@javascript
Feature: Checkout and pay for new user

    As a Customer
    So that I can place my order for the first time
    I want to checkout
    
    Background:
        Given the following vendors exist:
        | name | address | email|
        | Chipotle | 123 Dwight way, Berkeley, CA, 1234 | chipotle@c.com |

    
        And the following items exist:
        | name | vendor | price | description | quantity |
        | Regular Burrito | Chipotle | 2.50 | the usual | 55 |
        | Spicy Burrito | Chipotle | 3.50 | on fire | 91 |
        | Carne Asada Burrito | Chipotle | 5.50 | roasted beef | 2 |
        
        And the following Delivery Points exist:
        | address | latitude | longitude |
        | 123 Dwight way, Berkeley, CA, 1234 | 12 | 23 |

        And I have added the following items to my cart and have selected the pickup point "123 Dwight way Berkeley, CA 1234":
        | name | qty |
        | Regular Burrito | 2 |
        | Spicy Burrito | 2 |

        And I am on the home page
        And I follow "cart_link"
        And I press "Checkout"
        
        
    Scenario: See checkout for guest
        Then I should see "Credit Card Info"
        And I should see "Card number"
        And I should see "Exp date"
        And I should see "Guest Info"
        And I should see "First name"
        And I should see "Last name"
        And I should see "Email"
        And I should see "Phone number"
        And I should see "Password"
        And I should see "Password confirmation"
        
    Scenario: Place order as new guest, success
        Given I fill in "modal_user_first_name" with "Billy"
        And I fill in "modal_user_last_name" with "Bob"
        And I fill in "modal_user_email" with "billy@bob.com"
        And I fill in "modal_user_phone_number" with "+1 (123) 123-1232"
        And I fill in "modal_user_password" with "aaaaaaaa"
        And I fill in "modal_user_password_confirmation" with "aaaaaaaa"
        And I fill in "credit_card_card_number" with "4111-1111-1111-1111"
        And I fill in "credit_card_exp_date" with "12/2020"
        And I press "Pay"


    Scenario: Plase order as guest with invalid user info
        Given I press "Pay"
        Then I should see "Email can't be blank"
        And I should see "Password can't be blank"
        And I should see "First name can't be blank"
        And I should see "Last name can't be blank"
        And I should see "Phone number area code must be 3 digits"
        And I should see "Phone number number number must be 7 digits and of the form 'ddd-dddd'"

    Scenario: Place order as guest with invalid credit card info
        Given I fill in "modal_user_first_name" with "Billy"
        And I fill in "modal_user_last_name" with "Bob"
        And I fill in "modal_user_email" with "billy@bob.com"
        And I fill in "modal_user_phone_number" with "+1 (123) 123-1232"
        And I fill in "modal_user_password" with "aaaaaaaa"
        And I fill in "modal_user_password_confirmation" with "aaaaaaaa"
        And I press "Pay"


