
Then(/^a "(.*?)" modal should appear$/) do |selector|
    page.should have_selector(selector)
end

When(/^I select "(.*?)" in "(.*?)"$/) do |option, selector|
    within selector do
        find("option", text: option).click
    end
end

When /^(?:|I )follow "([^"]*)" and confirm$/ do |link|
    page.evaluate_script('window.confirm = function() { return true; }')
    click_link(link)
end

Then /^I should see the button "(.*)"$/ do |title|
	page.should have_selector(:button, title)
end

Given /^slow for selenium$/ do
	set_speed(:medium)
end