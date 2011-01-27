@wip
Feature: Manage skills required for position
  In order to create new certification
  As a CTO or HR
  I want to define required skills per position

  Background:
    Given I am an authenticated user

  Scenario: Listing skills 
    Given 5 position_skills exist
    When I am on the position_skills page
    Then I should see all existing position_skills

  Scenario: Create new position_skill with valid data
    When I am on the new position_skill page
    And I submit valid position_skill information
    Then new position_skill should exists

  @wip
  Scenario: Create new position_skill with invalid data
    When I am on the new position_skill page
    And I submit invalid position_skill information
    Then new position_skill should not exists

  Scenario: Update position_skill with valid data
    Given a position_skill exists
    And I am on the edit position_skill page for existing position_skill
    When I submit valid position_skill information
    Then exsisting position_skill should be updated

  Scenario: Update position_skill with invalid data
    Given a position_skill exists
    And I am on the edit position_skill page for existing position_skill
    When I submit invalid position_skill information
    Then exsisting position_skill should not be updated