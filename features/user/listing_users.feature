Feature: Listing users
  In order to know how many users I have in the system
  As an admin or HR
  I want to browse users

  Background:
    Given I am an authenticated user
    And a confirmed_user exists with email: "david@example.com"
    And another confirmed_user exists with email: "mary@example.com"

  Scenario Outline: Admin or HR list users
    Given I have "<role>" role
    When I go to the users page
    Then I should see "david@example.com"
    And I should see "mary@example.com"

      Examples:
        | role |
        | Admin |
        | HR |

  Scenario Outline: Admin or HR should be able to see manage links
    Given I have "<role>" role
    When I am on the users page
    Then I should see "Edit"
    And I should see "Destroy"

      Examples:
        | role |
        | Admin |
        | HR |

  Scenario Outline: Admin or HR user should not see manage links on self
    Given I have "<role>" role
    When I am on the users page
    Then I should not see "Destroy" within "#user_1"
    And I should not see "Edit" within "#user_1"

      Examples:
        | role |
        | Admin |
        | HR |

  Scenario: Regular users should not be able to see manage links
    Given I have "User" role
    When I am on the users page
    Then I should not see "Edit"
    And I should not see "Destroy"

  Scenario: Regular users should not see link to users page
    When I am on the home page
    Then I should not see "User"

  Scenario: Regular users should not be able to list users with direct request
    When I go to the users page
    Then access should be denied via authorization rule

  Scenario: Visitor should not be able to list users
    Given I am logged out
    When I go to the users page
    Then access should be denied via authentication rule
