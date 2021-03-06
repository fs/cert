Feature: Show certification report
  In order to make decision based on certification results
  As an admin or HR
  I want to view certification report

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
    And the following confirmed users exist
      | confirmed user | full_name |
      | chris          | Chris     |
      | joe            | Joe       |
    And the following certifications exist
      | certification   | user         | position          |
      | chris at junior | user "chris" | position "junior" |
      | me at junior    | user "me"    | position "junior" |


  Scenario Outline: Admin or HR view certification report
    Given the following certifications_experts exist
      | certification                    | user        |
      | certification: "chris at junior" | I           |
      | certification: "chris at junior" | user: "joe" |
    And the following certification marks exist
      | certification                    | id | skill              | user        | mark | comment           |
      | certification: "chris at junior" | 1  | skill: "talk"      | I           | 0    | Can't talk at all |
      | certification: "chris at junior" | 2  | skill: "talk"      | user: "joe" | 0    | Just silent man   |
      | certification: "chris at junior" | 3  | skill: "proactive" | I           | 1    | OK                |

    And I have "<role>" role
    When I am on the certification: "chris at junior"'s reports page

    Then I should see "Communication" within "#skill_type_1"
    And should see "Should be able to talk" within "#skill_type_1 #skill_1"
    And I should see "less" mark with "Can't talk at all" comment within "#skill_type_1 #skill_1 #certification_mark_1"
    And I should see "less" mark with "Just silent man" comment within "#skill_type_1 #skill_1 #certification_mark_2"
    And should see "Initiative" within "#skill_type_2"
    And should see "Should be proactive" within "#skill_type_2 #skill_2"
    And I should see "normal" mark within "#skill_type_2 #skill_2 #certification_mark_3"

      Examples:
        | role  |
        | Admin |
        | HR    |


  Scenario: User view report for his certification
    Given the following certifications_experts exist
      | certification                 | user        |
      | certification: "me at junior" | user: "joe" |
      | certification: "me at junior" | user: "chris" |

    And the following certification marks exist
      | certification                 | id | skill              | user          | mark | comment           |
      | certification: "me at junior" | 1  | skill: "talk"      | user: "chris" | 0    | Can't talk at all |
      | certification: "me at junior" | 2  | skill: "talk"      | user: "joe"   | 0    | Just silent man   |
      | certification: "me at junior" | 3  | skill: "proactive" | I             | 1    | OK                |

    And I have "User" role
    When I am on the certification: "me at junior"'s reports page
    Then I should see "Communication" within "#skill_type_1"
    And should see "Should be able to talk" within "#skill_type_1 #skill_1"
    And I should see "less" mark with "Can't talk at all" comment within "#skill_type_1 #skill_1 #certification_mark_1"
    And I should see "less" mark with "Just silent man" comment within "#skill_type_1 #skill_1 #certification_mark_2"
    And should see "Initiative" within "#skill_type_2"
    And should see "Should be proactive" within "#skill_type_2 #skill_2"
    And I should see "normal" mark within "#skill_type_2 #skill_2 #certification_mark_3"

  Scenario: User should not be able to view report for other users certifications
    When I go to the certification: "chris at junior"'s reports page
    Then access should be denied via authorization rule

  Scenario: Visitor should not be able to view certification reports
    Given I am logged out
    When I go to the certification's reports page
    Then access should be denied via authentication rule
