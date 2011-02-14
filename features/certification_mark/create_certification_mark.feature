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
    Given I am on the user: "chris"'s certification's new certification_mark page
    When I select "Should be able to talk" from "Skill"
    And choose "normal"
    And press "Create Certification mark"
    Then 1 certification marks should exist with certification: certification "chris at junior", user: user "current_user", skill: skill "talk", mark: 1

  Scenario Outline: Create un normal mark for certification with comment
    Given I am on the user: "chris"'s certification's new certification_mark page
    When I select "Should be able to talk" from "Skill"
    And choose "<mark_label>"
    And I fill in "Comment" with "Some extra skill"
    And press "Create Certification mark"
    Then 1 certification marks should exist with certification: certification "chris at junior", user: user "current_user", skill: skill "talk", mark: <mark_value>

      Examples:
        | mark_label  | mark_value |
        | less        | 0 |
        | higher      | 2 |

  Scenario Outline: Create un normal mark for certification without comment
    Given I am on the user: "chris"'s certification's new certification_mark page
    When I select "Should be able to talk" from "Skill"
    And choose "<mark_label>"
    And I fill in "Comment" with ""
    And press "Create Certification mark"
    Then I should see "can't be blank" error for "certification_mark_comment"

      Examples:
        | mark_label |
        | less |
        | higher |

  Scenario: Try to create new mark if other one exist for given certification and skill
    Given a certification mark exists with certification: certification "chris at junior", user: user "current_user", skill: skill "talk", mark: 1
    And I am on the user: "chris"'s certification's new certification_mark page
    When I select "Should be able to talk" from "Skill"
    And choose "normal"
    And I fill in "Comment" with "Updated comment"
    And press "Create Certification mark"
    Then 1 certification marks should exist with certification: certification "chris at junior", user: user "current_user", skill: skill "talk", mark: 1
