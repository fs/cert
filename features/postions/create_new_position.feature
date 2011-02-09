Feature: Create new position
  In order to add new position in the company
  As a CTO or HR
  I want to create that new position

  Background:
    Given I am an authenticated user

  Scenario: Admin creates new position
    Given I have "Admin" role
    When I am on the new position page
    And I fill in "Name" with "System Administrator"
    And press "Create Position"
    Then I should be on the positions page
    And I should see "System Administrator"
    And a position should exist with name: "System Administrator"

  Scenario: Visitor should not be able to create positions with direct request
    Given I am logged out
    When I send "POST" request to the positions page
    Then access should be denied via authentication rule

  Scenario Outline: Regular users should not be able to create position with direct request
    Given I have "<role>" role
    When I send "POST" request to the positions page
    Then access should be denied via authorization rule

    Examples:
      | role |
      | User |
      | HR |
