Feature: Listing skills per skill type
  In order to get familiar with existing skills
  As an authenticated user
  I want to list skills per skill type

  Background:
    Given I am an authenticated user
    And a position: "junior" exists with name: "Junior developer", id: 1
    And a position: "senior" exists with name: "Senior developer", id: 2
    And a skill_type: "communication" exists with name: "Communication"
    And a skill_type: "initiative" exists with name: "Initiative"
    And the following skills exist
      | skill_type                 | position          | description             |
      | skill_type "communication" | position "junior" | Should be able to talk  |
      | skill_type "communication" | position "senior" | Should be able to write |
      | skill_type "initiative"    | position "senior" | Should be proactive     |

  Scenario Outline: All users should be able to list skills
    Given I have "<role>" role
    And I am on the skill_types page
    When I follow "Communication"
    Then I should see "Should be able to talk" within "#position_1"
    And I should see "Should be able to write" within "#position_2"
    And I should not see "Should be proactive" within "#position_2"

      Examples:
      | role |
      | User |
      | HR |
      | Admin |

  Scenario Outline: Admin or HR users should see links for managing skills
    Given I have "<role>" role
    And I am on the skill_types page
    When I follow "Communication"
    Then I should see "Edit" within "#position_1"
    And I should see "Destroy" within "#position_1"
    And the "skill_description" field within "#position_1" should exists

    Examples:
      | role |
      | Admin |
      | HR |

  Scenario Outline: Regular users should not see links for managing skills
    Given I have "<role>" role
    And I am on the skill_types page
    When I follow "Communication"
    Then I should not see "Edit" within "#position_1"
    And I should not see "Destroy" within "#position_1"
    And I should not see "Create Skill" within "#position_1"

    Examples:
      | role |
      | User |

  Scenario: Visitor should not be able to list positions
    Given I am logged out
    When I go to the skill_type's skills page
    Then access should be denied via authentication rule
