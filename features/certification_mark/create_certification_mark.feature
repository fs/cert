Feature: Create certification mark
  In order to mark developer's skill
  As a expert
  I want to create new certification mark for given certification and skill

  Background:
    Given the following positions exist
      | position | id | name             |
      | junior   | 1  | Junior developer |
      | senior   | 2  | Senior developer |
    And the following skill_types exist
      | skill_type    | name          |
      | communication | Communication |
      | initiative    | Initiative    |
    And the following skills exist
      | skill | id | skill_type                  | position           | description            |
      | talk  | 1  | skill_type: "communication" | position: "junior" | Should be able to talk |
    And a confirmed user: "chris" exists with full_name: "Chris"
    And a certification: "chris at junior" exists with user: user "chris", position: position "junior"
    And I am an authenticated user
    And I have "Expert" role
    And I expert for the certification "chris at junior"

  Scenario: Create new mark for certification
    Given I am on the user: "chris"'s certification's certification marks page
    When I choose "normal" within "#skill_1"
    And press "Create Certification mark" within "#skill_1"
    Then 1 certification marks should exist with certification: certification "chris at junior", user: I, skill: skill "talk", mark: 1

  Scenario Outline: Create un normal mark for certification with comment
    Given I am on the user: "chris"'s certification's certification marks page
    When I choose "<mark_label>" within "#skill_1"
    And I fill in "certification_mark[comment]" with "Some extra skill" within "#skill_1"
    And press "Create Certification mark" within "#skill_1"
    Then 1 certification marks should exist with certification: certification "chris at junior", user: I, skill: skill "talk", mark: <mark_value>

      Examples:
        | mark_label  | mark_value |
        | less        | 0 |
        | higher      | 2 |

  Scenario: Try to create new mark if other one exist for given certification and skill
    Given a certification mark exists with certification: certification "chris at junior", user: I, skill: skill "talk", mark: 1
    And I am on the user: "chris"'s certification's certification marks page
    When choose "normal" within "#skill_1"
    And I fill in "certification_mark[comment]" with "Updated comment" within "#skill_1"
    And press "certification_mark_submit" within "#skill_1"
    Then 1 certification marks should exist with certification: certification "chris at junior", user: I, skill: skill "talk", mark: 1
