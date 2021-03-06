@javascript
Feature: View cart and edit items

    As a customer
    So that I can see what I intend to order so far
    I want to see my cart
    
    Background:
        Given the following items exist:
        | name                | vendor   | price | description  |
        | Regular Burrito     | Chipotle | 2.50  | the usual    |
        | Spicy Burrito       | Chipotle | 3.50  | on fire      |
        | Carne Asada Burrito | Chipotle | 5.50  | roasted beef |
        
        And I have added the following items to my cart:
        | name                | qty |
        | Regular Burrito     | 2   |
        | Spicy Burrito       | 2   |

        And I am on the home page
        And I follow "cart_link"
    
    Scenario: see the cart
        Then I should see "Regular Burrito"
        And I should see "Spicy Burrito"
        And I should see "2"
        And I should see "$2.50"
        And I should see "$3.50"
        And I should see "$12.00"
        
    Scenario: alter quantity
        Given I increase the quantity of "Regular Burrito"
        And I decrease the quantity of "Spicy Burrito"
        Then I should see "3"
        And I should see "1"
        And I should see "$2.50"
        And I should see "$3.50"
        And I should see "$11.00"
    
    Scenario: remove item
        Given I remove "Regular Burrito"
        Then I should not see "Regular Burrito"
