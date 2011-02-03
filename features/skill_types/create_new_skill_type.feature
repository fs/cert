Feature: Create new skill type
  In order to add skill type for positions
  As a CTO or HR
  I want to create that new skill type

  Background:
    Given I am an authenticated user
    And I am on the skill_types page

  Scenario: Create new skill type
    When I follow "New skill type"
    Then I should be on the new skill_type page
    When I fill in "Name" with "Communication"
    And press "Create Skill type"
    Then I should be on the skill_types page
    And I should see "Communication"
    And a skill type should exist with name: "Communication"


