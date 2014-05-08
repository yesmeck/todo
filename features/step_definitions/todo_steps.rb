Given(/^I have todo "(.*?)"$/) do |title|
  @todo = create(:todo, title: title, user: @user)
end

Then(/^I should see "(.*?)"$/) do |title|
  page.should have_content(title)
end

When(/^I visit home page$/) do
  visit root_path
end

When(/^I fill in Todo with "(.*?)"$/) do |title|
  fill_in 'todo_title', with: title
end

When(/^press enter$/) do
  find("#todo_title").set("\t")
end

When(/^I click "(.*?)"$/) do |text|
  click_link text
end

Then(/^I should see "(.*?)" is completed$/) do |title|
  page.should have_css("#todo_#{@todo.id}.complete")
end

Given(/^"(.*?)" completed$/) do |title|
  todo = Todo.find_by(title: title)
  todo.complete!
end

Then(/^I should see "(.*?)" is uncompleted$/) do |title|
  page.should have_content(title)
  page.should_not have_css("#todo_#{@todo.id}.complete")
end

Then(/^I should not see "(.*?)"$/) do |title|
  page.should_not have_content(title)
end
