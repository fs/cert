Feature: Manage skills
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Background:
    Given I am an authenticated user

  Scenario: Listing skills
    Given 5 skills exist
    When I am on the skills page
    Then I should see all existing skills

  Scenario: Create new skill with valid data
    When I am on the new skill page
    And I submit valid skill information
    Then new skill should exists

  Scenario: Create new skill with invalid data
    When I am on the new skill page
    And I submit invalid skill information
    Then new skill should not exists

  Scenario: Update skill with valid data
    Given a skill exists
    And I am on the edit skill page for existing skill
    When I submit valid skill information
    Then exsisting skill should be updated

  Scenario: Update skill with invalid data
    Given a skill exists
    And I am on the edit skill page for existing skill
    When I submit invalid skill information
    Then exsisting skill should not be updated