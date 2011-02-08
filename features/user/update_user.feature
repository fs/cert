Feature: Update user
  In order to have actual information for all users in the system
  As a authenticated user
  I want to update user's information

  Background:
    Given I am an authenticated user
    And a role: "CTO" exists with name: "CTO", id: 1
    And another role: "HR" exists with name: "HR", id: 2
    And a user: "chris" exists with email: "chris@example.com"
    And user: "chris" has role: "CTO"
    And I am on the user's edit page

  Scenario: Update user
    When I fill in "Email" with "chris@gmail.com"
    And I press "Update User"
    Then a user should exist with email: "chris@gmail.com"
    And I should be on the users page

  Scenario: Update user with invalid email
    When I fill in "Email" with "some invalid email goes here"
    And I press "Update User"
    Then I should see "invalid" error for "user_email"
    And a user should not exist with email: "some invalid email goes here"

  Scenario: Listing roles for CTO
    Then the "CTO" checkbox should be checked
    And the "HR" checkbox should not be checked

  Scenario: Grant HR role to CTO
    When I check "HR"
    And I press "Update User"
    Then role "HR" should be in the user "chris"'s roles
    And role "CTO" should be in the user "chris"'s roles

  Scenario: Permit CTO role
    When I uncheck "CTO"
    And I press "Update User"
    Then role "CTO" should not be in the user "chris"'s roles
