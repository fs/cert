Feature: Create new skill type
  In order to add skill type for positions
  As a CTO or HR
  I want to create that new skill type

  Background:
    Given I am an authenticated user
    And I am on the skill_types page

   Scenario: Admin creates new skill type
    Given I have "Admin" role
    When I am on the new skill_type page
    And I fill in "Name" with "Communication"
    And press "Create Skill type"
    Then I should be on the skill_types page
    And I should see "Communication"
    And a skill_type should exist with name: "Communication"

  Scenario: Visitor should not be able to create skill type with direct request
    Given I am logged out
    When I send "POST" request to the skill_types page
    Then access should be denied via authentication rule

  Scenario Outline: Regular users should not be able to create skill type with direct request
    Given I have "<role>" role
    When I send "POST" request to the skill_types page
    Then access should be denied via authorization rule

    Examples:
      | role |
      | User |
      | HR |
