Feature: Edit skill
  In order to have acual skills
  As a CTO or HR
  I want to update skills

  Background:
    Given I am an authenticated user
    And a position: "junior" exists with name: "Junior developer"
    And a position: "senior" exists with name: "Senior developer"
    And a skill_type: "communication" exists with name: "Communication"
    And the following skills exist
      | skill_type | position | description |
      | skill_type "communication" | position "junior" | Should be able to talk |
      | skill_type "communication" | position "senior" | Should be able to write |    
    And I am on the skill_type's skills page

  Scenario: Update communication skill for Junior developer
    When I follow "Edit" within "#position_1 #skill_1"
    And I fill in "Description" with "Updated skill"
    And I press "Update Skill"
    Then 1 skills should exist with description: "Updated skill", position: position "junior", skill_type: skill_type "communication"

  Scenario: Update communication skill for Junior developer without description
    When I follow "Edit" within "#position_1 #skill_1"
    And I fill in "Description" with ""
    And I press "Update Skill"
    Then I should see "can't be blank" error for "skill_description"
    And 0 skills should exist with description: "Updated skill", position: position "junior", skill_type: skill_type "communication"
