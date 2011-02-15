Feature: Listing certification marks
  In order to be set marks for certification
  As an expert
  I want to list marks

  Background:
    Given  I am an authenticated user
    And the following positions exist
      | position | name             |
      | junior   | Junior developer |
    And the following skill_types exist
      | skill_type    | id | name          |
      | communication | 1  | Communication |
      | initiative    | 2  | Initiative    |
    And the following skills exist
      | skill     | id | skill_type                  | position           | description            |
      | talk      | 1  | skill_type: "communication" | position: "junior" | Should be able to talk |
      | proactive | 2  | skill_type "initiative"     | position "junior"  | Should be proactive    |

  Scenario: Expert following link to marks from certifications page
    Given I have "Expert" role
    And a confirmed user: "chris" exists with full_name: "Chris"
    And a certification: "chris at junior" exists with user: user "chris"
    And I expert for the certification "chris at junior"
    When I am on the certifications page
    And follow "Mark"
    Then I should be on the user: "chris"'s certification: "chris at junior"'s certification marks page

  Scenario: Expert should see certifications where he participate as expert
    Given I have "Expert" role
    And a confirmed user: "chris" exists with full_name: "Chris"
    And a certification: "chris at junior" exists with user: user "chris", position: position "junior"
    And the following certification marks exist
      | certification                    | skill              | user | mark | comment           |
      | certification: "chris at junior" | skill: "talk"      | I    | 0    | Can't talk at all |
      | certification: "chris at junior" | skill: "proactive" | I    | 1    |                   |
    And I expert for the certification "chris at junior"
    When I am on the user: "chris"'s certification: "chris at junior"'s certification marks page
    Then I should see "Communication" within "#skill_type_1"
    And should see "Should be able to talk" within "#skill_type_1 #skill_1"
    And the "Comment" field within "#skill_type_1 #skill_1" should contain "Can't talk at all"
    And the "less" checkbox within "#skill_type_1 #skill_1" should be checked
    And should see "Initiative" within "#skill_type_2"
    And should see "Should be proactive" within "#skill_type_2 #skill_2"
    And the "normal" checkbox within "#skill_type_2 #skill_2" should be checked

  Scenario: User should see his own certification marks
    Given a certification: "me at junior" exists with user: I, position: position "junior"
    When I go to the user: "me"'s certification: "me at junior"'s certification marks page
    Then I should see "Communication" within "#skill_type_1"
    And should see "Should be able to talk" within "#skill_type_1 #skill_1"
    And should see "Initiative" within "#skill_type_2"
    And should see "Should be proactive" within "#skill_type_2 #skill_2"

  @wip
  Scenario: Expert should not see certification marks for certification where he participate as expert without expert role
    Given a confirmed user: "chris" exists with full_name: "Chris"
    And a certification: "chris at junior" exists with user: user "chris", position: position "junior"
    And I expert for the certification "chris at junior"
    When I go to the user: "chris"'s certification: "chris at junior"'s certification marks page
    Then access should be denied via authorization rule

  @wip
  Scenario: Regular user should not be able list certification marks for other users
    Given a confirmed user: "chris" exists with full_name: "Chris"
    And a certification: "chris at junior" exists with user: user "chris", position: position "junior"
    When I go to the user: "chris"'s certification: "chris at junior"'s certification marks page
    Then access should be denied via authorization rule

  Scenario: Visitor should not be able list certification marks
    Given I am logged out
    And a confirmed user: "chris" exists with full_name: "Chris"
    And a certification: "chris at junior" exists with user: user "chris", position: position "junior"
    When I go to the user: "chris"'s certification: "chris at junior"'s certification marks page
    Then access should be denied via authentication rule







