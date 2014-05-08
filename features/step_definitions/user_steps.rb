World(FactoryGirl::Syntax::Methods)

Given(/^I am on the sign up page$/) do
  visit sign_up_path
end

When(/^I fill in email with "(.*?)"$/) do |email|
  fill_in 'Email', with: email
end

When(/^I fille in password with "(.*?)"$/) do |password|
  fill_in 'Password', with: password
end

When(/^I click button  "(.*?)"$/) do |text|
  click_button text
end

Then(/^I should be signed in as "(.*?)"$/) do |email|
  page.should have_content(email)
end

Given(/^a user$/) do
  create(:user)
end

When(/^I am on the sign in page$/) do
  visit sign_in_path
end

Given(/^I sign in as a user$/) do
  @user = create(:user)
  visit sign_in_path
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button "Sign in"
end

When(/^I click sign out$/) do
  click_link 'Sign out'
end

Then(/^I should be signed out$/) do
  page.should have_content('Sign in')
end

