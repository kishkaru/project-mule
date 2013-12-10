When(/^I confirm popup$/) do
  page.driver.browser.switch_to.alert.text
end


Given(/^I follow "(.*?)" for "(.*?)""$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^I should see "(.*?)" button$/) do |arg1|
  find_button(arg1).should_not be_nil 
end

Then(/^I should see a popup window$/) do
 page.evaluate_script('window.confirm = function() {return true;}')
end

Given(/^the following menus exist:$/) do |menu_table|
  menu_table.hashes.each do |menu|
    Menu.create!(menu)  
    end
end

When(/^I press Update$/) do
  pending # express the regexp above with the code you wish you had
end


