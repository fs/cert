Feature: Manage positions
  In order to [goal]
  [stakeholder]
  wants [behaviour]

  Background:
    Given I am an authenticated user

  Scenario: Listing positions
    Given 5 positions exist
    When I am on the positions page
    Then I should see all existing positions

  Scenario: Create new position with valid data
    When I am on the new position page
    And I submit valid position information
    Then new position should exists

  Scenario: Create new position with invalid data
    When I am on the new position page
    And I submit invalid position information
    Then new position should not exists

  Scenario: Update position with valid data
    Given a position exists
    And I am on the edit position page for existing position
    When I submit valid position information
    Then exsisting position should be updated

  Scenario: Update position with invalid data
    Given a position exists
    And I am on the edit position page for existing position
    When I submit invalid position information
    Then exsisting position should not be updated