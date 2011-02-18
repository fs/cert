Feature: Create skill
  In order to create new certification
  As an admin or HR
  I want to create new skill

  Background:
    Given I am an authenticated user
    And a position: "junior" exists with name: "Junior developer", id: 1
    And a position: "senior" exists with name: "Senior developer", id: 2
    And a skill_type: "communication" exists with name: "Communication"

  Scenario Outline: Admin or HR creates new skill for junior developer
    Given I have "<role>" role
    And I am on the skill_type's skills page
    When I fill in "skill_description" with "Should be able to listen" within "div#position_1"
    And I press "Create Skill" within "div#position_1"
    Then 1 skills should exist with description: "Should be able to listen", position: position "junior", skill_type: skill_type "communication"

      Examples:
      | role |
      | HR |
      | Admin |

  Scenario Outline: Admin or HR create new skill for junior developer without description
    Given I have "<role>" role
    And I am on the skill_type's skills page
    When I fill in "skill_description" with "" within "div#position_1"
    And I press "Create Skill" within "div#position_1"
    Then I should be on the skill_type's skills page
    And I should see "can't be blank" error for "skill_description"
    And 0 skills should exist with position: position "junior", skill_type: skill_type "communication"

      Examples:
      | role |
      | HR |
      | Admin |

  Scenario: Visitor should not be able to create new skill with direct request
    Given I am logged out
    When I send "POST" request to the skill_type's skills page
    Then access should be denied via authentication rule

  Scenario: Regular users should not be able to create new skill with direct request
    Given I have "User" role
    When I send "POST" request to the skill_type's skills page
    Then access should be denied via authorization rule
