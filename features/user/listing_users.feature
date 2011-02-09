Feature: Listing users
  In order to know how many users I have in the system
  As a authenticated user
  I want to browse users

  Background:
    Given I am an authenticated user
    And I am on the home page
    And a confirmed_user exists with email: "david@example.com"
    And another confirmed_user exists with email: "mary@example.com"
    When I follow "Users"

  Scenario: Listing users
    Then I should see "david@example.com"
    And I should see "mary@example.com"

  Scenario: Current user should not be able to edit self
    Then I should not see "Destroy" within "#user_1"
    And I should not see "Edit" within "#user_1"
