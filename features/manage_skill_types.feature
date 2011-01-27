Feature: Manage skill types
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Background:
    Given I am an authenticated user

  Scenario: Listing skills
    Given 5 skill types exist
    When I am on the skill types page
    Then I should see all existing skill types

  Scenario: Create new skill type with valid data
    When I am on the new skill type page
    And I submit valid skill type information
    Then new skill type should exists

  Scenario: Create new skill type with invalid data
    When I am on the new skill type page
    And I submit invalid skill type information
    Then new skill type should not exists

  Scenario: Update skill type with valid data
    Given a skill type exists
    And I am on the edit skill type page for existing skill type
    When I submit valid skill type information
    Then existing skill type should be updated

  Scenario: Update skill type with invalid data
    Given a skill type exists
    And I am on the edit skill type page for existing skill type
    When I submit invalid skill type information
    Then existing skill type should not be updated