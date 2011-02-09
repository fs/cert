Feature: Update skill type
  In order to have up to date skill types
  As an administrator
  I want to update skill type

  Background:
    Given I am an authenticated user
    And a skill_type exists with name: "Communication"

  Scenario: Admin updates skill type
    Given I have "Admin" role
    When I am on the skill_type's edit page
    And I fill in "Name" with "Initiative"
    And press "Update Skill type"
    Then I should be on the skill_types page
    And I should see "Initiative"

  Scenario: Visitor should not be able to update skill type with direct request
    Given I am logged out
    When I send "PUT" request to the skill_type's page
    Then access should be denied via authentication rule

  Scenario Outline: Regular users should not be able to update skill type with direct request
    Given I have "<role>" role
    When I send "PUT" request to the skill_type's page
    Then access should be denied via authorization rule

  Examples:
    | role |
    | User |
    | HR   |

