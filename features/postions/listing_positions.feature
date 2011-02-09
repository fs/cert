Feature: Listing positions
  In order to review existing positions
  As a CTO or HR
  I want to browse positions

  Background:
    Given I am an authenticated user
    And position exists with name: "Junior developer"
    And another position exists with name: "Senior developer"
    And I am on the home page

  Scenario: Admin should be able to manage positions
    Given I have "Admin" role
    When I am on the positions page
    Then I should see "Edit"
    And I should see "Destroy"
    And I should see "New Position"

  Scenario Outline: All users should be able to list positions
    Given I have "<role>" role
    Then I should see "Positions"
    When I follow "Positions"
    Then I should be on the positions page
    Then I should see "Junior developer"
    And I should see "Senior developer"

    Examples:
      | role |
      | User |
      | HR |
      | Admin |

  Scenario Outline: Regular users should not see links for managing positions
    Given I have "<role>" role
    When I am on the positions page
    Then I should not see "Edit"
    And I should not see "Destroy"
    And I should not see "New Position"

    Examples:
      | role |
      | User |
      | HR |

  Scenario: Visitor should not be able to list positions
    Given I am logged out
    When I go to the positions page
    Then access should be denied via authentication rule

