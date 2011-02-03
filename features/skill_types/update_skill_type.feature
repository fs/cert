Feature: Update skill type
  In order to have up to date skill types
  As a CTO or HR
  I want to update skill type

  Background:
    Given I am an authenticated user
    And a skill_type exists with name: "Communication"
    And I am on the skill_type's edit page

  Scenario: Update skill type
    When I fill in "Name" with "Initiative"
    And press "Update Skill type"
    Then I should be on the skill_types page
    And I should see "Initiative"

