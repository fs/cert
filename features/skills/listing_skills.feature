Feature: Listing skills
  In order to get familiar with existing skills
  As a CTO or HR
  I want to list skills per skill type

  Background:
    Given I am an authenticated user
    And a position: "junior" exists with name: "Junior developer"
    And a position: "senior" exists with name: "Senior developer"
    And a skill_type: "communication" exists with name: "Communication"
    And a skill_type: "initiative" exists with name: "Initiative"
    And the following skills exist
      | skill_type | position | description |
      | skill_type "communication" | position "junior" | Should be able to talk |
      | skill_type "communication" | position "senior" | Should be able to write |
      | skill_type "initiative" | position "senior" | Should be proactive |
    And I am on the skill_types page

  Scenario: Listing skills per type
    When I follow "Communication"
    Then I should see "Should be able to talk" within "#position_1"
    And I should see "Should be able to write" within "#position_2"
    And I should not see "Should be proactive" within "#position_2"
