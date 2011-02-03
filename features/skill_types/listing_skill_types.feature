Feature: Listing skill types
  In order to review existing skill types
  As a CTO or HR
  I want to browse skill types

  Background:
    Given I am an authenticated user
    And I am on the home page

  Scenario: Listing skill types
    Given skill_type exists with name: "Communication"
    And another skill_type exists with name: "Initiative"
    When I follow "Skill types"
    Then I should be on the skill_types page
    And I should see "Communication"
    And I should see "Initiative"

