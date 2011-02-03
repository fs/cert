Feature: Create new position
  In order to add new position in the company
  As a CTO or HR
  I want to create that new position

  Background:
    Given I am an authenticated user
    And I am on the positions page

  Scenario: Create new position
    When I follow "New Position"
    Then I should be on the new position page
    When I fill in "Name" with "System Administrator"
    And press "Create Position"
    Then I should be on the positions page
    And I should see "System Administrator"
    And a position should exist with name: "System Administrator"


