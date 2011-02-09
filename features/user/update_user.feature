Feature: Update user
  In order to have actual information for all users in the system
  As an admin or HR
  I want to update user's information

  Background:
    Given I am an authenticated user
    And a role: "CTO" exists with name: "CTO", id: 1
    And another role: "HR" exists with name: "HR", id: 2
    And a user: "chris" exists with email: "chris@example.com"
    And user: "chris" has role: "CTO"

  Scenario Outline: Admin or HR updates user
    Given I have "<role>" role
    And I am on the user's edit page
    When I fill in "Email" with "chris@gmail.com"
    And I press "Update User"
    Then a user should exist with email: "chris@gmail.com"
    And I should be on the users page

      Examples:
        | role |
        | HR |
        | Admin |

  Scenario Outline: Admin or HR updates user with invalid email
    Given I have "<role>" role
    And I am on the user's edit page
    When I fill in "Email" with "some invalid email goes here"
    And I press "Update User"
    Then I should see "invalid" error for "user_email"
    And a user should not exist with email: "some invalid email goes here"

      Examples:
        | role |
        | HR |
        | Admin |

  Scenario: Admin lists roles for CTO
    Given I have "Admin" role
    And I am on the user's edit page
    Then the "CTO" checkbox should be checked
    And the "HR" checkbox should not be checked

  Scenario: Admin grants HR role to CTO
    Given I have "Admin" role
    And I am on the user's edit page
    When I check "HR"
    And I press "Update User"
    Then role "HR" should be in the user "chris"'s roles
    And role "CTO" should be in the user "chris"'s roles

  Scenario: Admin permits CTO role
    Given I have "Admin" role
    And I am on the user's edit page
    When I uncheck "CTO"
    And I press "Update User"
    Then role "CTO" should not be in the user "chris"'s roles

  Scenario: Regular users should not be able to access user's edit page
    Given I have "User" role
    When I go to the user's edit page
    Then access should be denied via authorization rule

  Scenario: Regular user should not be able to update other users with direct request
    Given I have "User" role
    When I send "PUT" request to the user's page
    Then access should be denied via authorization rule

  Scenario: HR should not be able see roles for other users
    Given I have "HR" role
    When I am on the user's edit page
    Then I should not see "Roles"

  Scenario: HR should not be able to update roles for other users with direct request
    Given I have "HR" role
    When I send "PUT" request to the user's page with roles_ids: "" namespaced with "user"
    And role "CTO" should be in the user "chris"'s roles

  Scenario: Visitor should not be able to update users with direct request
    Given I am logged out
    When I send "PUT" request to the user's page
    Then access should be denied via authentication rule
    