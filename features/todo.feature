Feature: Todo

  Background:
    Given I sign in as a user
    And I have todo "make a wish"
    When I visit home page

  Scenario: View todo list
    Then I should see "make a wish"

  @javascript
  Scenario: Add a new todo
    When I fill in Todo with "make a wish"
    And press enter
    And I visit home page
    Then I should see "make a wish"


  @javascript
  Scenario: Complete a todo
    When I click "✔"
    And I visit home page
    Then I should see "make a wish" is completed

  @javascript
  Scenario: Uncomplete a todo
    Given "make a wish" completed
    When I visit home page
    When I click "✔"
    And I visit home page
    Then I should see "make a wish" is uncompleted

  @javascript
  Scenario: Delete a todo
    When I click "✘"
    And I visit home page
    Then I should not see "make a wish"


