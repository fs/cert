Feature: Manage skills required for position
  In order to create new certification
  As a CTO or HR
  I want to define required skills per position

  Background:
    Given I am an authenticated user
    And a position: "junior" exists with name: "Junior developer"
    And a position: "senior" exists with name: "Senior developer"
    And a skill_type: "communication" exists with name: "Communication"
    And the following skills exist
      | skill_type | position | description |
      | skill_type "communication" | position "junior" | Should be able to talk |
      | skill_type "communication" | position "senior" | Should be able to write |
    And I am on the skill_types page

  Scenario: Listing skills per type
    When I follow "Communication"
    Then I should see all existing skills for "junior"
    And I should see all existing skills for "senior"
