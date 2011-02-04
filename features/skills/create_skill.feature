Feature: Create skill
  In order to create new certification
  As a CTO or HR
  I want to create new skill

  Background:
    Given I am an authenticated user
    And a position: "junior" exists with name: "Junior developer"
    And a position: "senior" exists with name: "Senior developer"
    And a skill_type: "communication" exists with name: "Communication"
    And I am on the skill_type's skills page


  Scenario: Create new skill for junior developer
    When I fill in "Description" with "Should be able to listen" within "div#position_1"
    And I press "Create Skill" within "div#position_1"
    Then 1 skills should exist with description: "Should be able to listen", position: position "junior", skill_type: skill_type "communication"

  Scenario: Create new skill for senior developer
    When I fill in "Description" with "Should be able to participate in the conference" within "div#position_2"
    And I press "Create Skill" within "div#position_2"
    Then 1 skills should exist with description: "Should be able to participate in the conference", position: position "senior", skill_type: skill_type "communication"

  Scenario: Create new skill for junior developer without description
    When I fill in "Description" with "" within "div#position_1"
    And I press "Create Skill" within "div#position_1"
    Then I should be on the skill_type's skills page
    And I should see "can't be blank" error for "skill_description"
    And 0 skills should exist with position: position "junior", skill_type: skill_type "communication"
