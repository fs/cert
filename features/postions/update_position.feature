Feature: Update position
  In order to have up to date positions
  As a CTO or HR
  I want to update position

  Background:
    Given I am an authenticated user
    And a position exists with name: "Junior developer"
    And I am on the position's edit page

  Scenario: Update position
    When I fill in "Name" with "Senior developer"
    And press "Update Position"
    Then I should be on the positions page
    And I should see "Senior developer"

