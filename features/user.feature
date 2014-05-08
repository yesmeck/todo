Feature: User

  Scenario: User sign up
    Given I am on the sign up page
    When I fill in email with "user@example.com"
    And I fille in password with "password"
    And I click button  "Sign up"
    Then I should be signed in as "user@example.com"

  Scenario: User sign in
    Given a user
    When I am on the sign in page
    When I fill in email with "user@example.com"
    And I fille in password with "password"
    And I click button  "Sign in"
    Then I should be signed in as "user@example.com"

  Scenario: User sign out
    Given I sign in as a user
    When I click sign out
    Then I should be signed out
