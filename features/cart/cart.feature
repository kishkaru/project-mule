Feature: View cart and edit items

    As a customer
    So that I can see what I intend to order so far
    I want to see my cart
    
    Background:
        Given the following items exist:
        | name                | vendor   | price | description  | quantity | expires_at |
        | Regular Burrito     | Chipotle | $2.50 | the usual    | 55       | 30/6/2020  |
        | Spicy Burrito       | Chipotle | $3.50 | on fire      | 91       | 3/3/2014   |
        | Carne Asada Burrito | Chipotle | $5.50 | roasted beef | 2        | 12/3/1976  |
        
        And I have added the following items to my cart:
        | name                | qty |
        | Regular Burrito     | 2   |
        | Spicy Burrito       | 2   |
         
        And I am on the home page
        And I follow "Cart"
    
    @javascript
    Scenario: see the cart
        Then I should see "Regular Burrito"
        And I should see "Spicy Burrito"
        And I should see "2"
        And I should see "5.00"
        And I should see "7.00"
        And I should see "12.00"
        
    Scenario: alter quantity
        Given I press "plus_regular_burrito"
        And I press "minus_spicy_burrito"
        Then I should see "3"
        And I should see "1"
        And I should see "7.50"
        And I should see "3.50"
        And I should see "11.00"
    
    Scenario: remove item
        Given I press "remove_regular_burrito"
        Then I should see a strike through "Regular Burrito"
        And I should see a strike through "quantity_regular_burrito"
        And I should see a strike through "price_regular_burrito" 
        And I should not see "$12.00"
        And I should see "Undo"
        
    Scenario: undo remove item
        Given I press "remove_regular_burrito"
        And I press "Undo"
        And I should not see a strike through "Regular Burrito"
        And I should not see a strike through "quantity_regular_burrito"
        And I should not see a string through "price_regular_burrito"
        And I should see "$12.00"