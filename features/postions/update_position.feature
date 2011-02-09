Feature: Update position
  In order to have up to date positions
  As a CTO or HR
  I want to update position

  Background:
    Given I am an authenticated user
    And a position exists with name: "Junior developer"

  Scenario: Admin updates position
    Given I have "Admin" role
    When I am on the position's edit page
    And I fill in "Name" with "Senior developer"
    And press "Update Position"
    Then I should be on the positions page
    And I should see "Senior developer"

  Scenario: Visitor should not be able to update positions with direct request
    Given I am logged out
    When I send "PUT" request to the position's page
    Then access should be denied via authentication rule

  Scenario Outline: Regular users should not be able to update position with direct request
    Given I have "<role>" role
    When I send "PUT" request to the position's page
    Then access should be denied via authorization rule

  Examples:
    | role |
    | User |
    | HR   |

