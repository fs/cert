Feature: Create certification mark
  In order to mark developer's skill
  As a expert
  I want to create new certification mark for given certification and skill

  Background:
    Given the following positions exist
      | position | id | name |
      | junior | 1 | Junior developer |
      | senior | 2 | Senior developer |
    And the following skill_types exist
      | skill_type | name |
      | communication | Communication |
      | initiative | Initiative |
    And the following skills exist
      | skill | skill_type | position | description |
      | talk |skill_type: "communication" | position: "junior" | Should be able to talk  |
    And a confirmed user: "chris" exists with full_name: "Chris"
    And a certification: "chris at junior" exists with user: user "chris", position: position "junior"
    And I am an authenticated user
    And I have "Expert" role
    And I expert for the certification "chris at junior"

  Scenario: Create new mark for certification
    Given I am on the certification's new certification_mark page
    When I select "Should be able to talk" from "Skill"
    And choose "normal"
    And press "Create Certification mark"
    Then 1 certification marks should exist with certification: certification "chris at junior", user: user "current_user", skill: skill "talk", mark: 1
