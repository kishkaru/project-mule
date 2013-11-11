
Then(/^a "(.*?)" modal should appear$/) do |selector|
    page.should have_selector(selector)
end

When(/^I select "(.*?)" in "(.*?)"$/) do |option, selector|
    within selector do
        find("option", text: option).click
    end
end
