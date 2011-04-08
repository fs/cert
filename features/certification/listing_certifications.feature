Feature: Listing certifications
  In order to know how many certifications I have right now
  As a authenticated user
  I want to list certifications

  Background:
    Given I am an authenticated user
    And a position: "junior" exists with name: "Junior developer"
    And a position: "senior" exists with name: "Senior developer"
    And a confirmed user: "chris" exists with full_name: "Chris"
    And a confirmed user: "john" exists with full_name: "John"
    And a certification: "chris at junior" exists with user: user "chris", position: position "junior", id: 1
    And another certification: "john at senior" exists with user: user "john", position: position "senior", id: 2

  Scenario Outline: Admin or HR list certifications
    Given I have "<role>" role
    When I go to the certifications page
    Then I should see "Junior developer" within "#certification_1"
    And I should see "Chris" within "#certification_1"
    And I should see "Senior developer" within "#certification_2"
    And I should see "John" within "#certification_2"
      Examples:
        | role |
        | Admin |
        | HR |

  Scenario Outline: Admin or HR list certifications for specific user
    Given I have "<role>" role
    When I go to the user: "chris"'s certifications page
    Then I should see "Junior developer" within "#certifications"
    And I should see "Chris" within "#certifications"
    And I should not see "Senior developer" within "#certifications"
    And I should not see "John" within "#certifications"
      Examples:
        | role |
        | Admin |
        | HR |

  Scenario Outline: Admin or HR should see links for managing certifications
    Given I have "<role>" role
    When I go to the certifications page
    Then I should see "Edit"
    And I should see "Destroy"
    And I should see "Mark"
    And I should see "Report"
      Examples:
        | role |
        | Admin |
        | HR |

  Scenario: Expert should see certifications where he participate as expert
    Given I have "Expert" role
    And I expert for the certification "chris at junior"
    When I go to the certifications page
    Then I should see "Chris" within "#certification_1"
    And I should see "Junior developer" within "#certification_1"

Scenario: User should not see certifications where he participate as expert without expert role
    Given I expert for the certification "chris at junior"
    When I go to the certifications page
    Then I should not see "Chris"
    And I should not see "Junior developer"

  Scenario: Expert should see certifications where he participate as expert and also his own certifications
    Given I have "Expert" role
    And I expert for the certification "chris at junior"
    And a certification exists with user: I, position: position "junior"
    When I go to the certifications page
    Then I should see "Chris" within "#certification_1"
    And should see "Junior developer" within "#certification_1"
    And should see "Current User"
    And should see "Junior developer"

  Scenario: Regular user should see only his certifications
    Given I have "User" role
    And a certification exists with user: I, position: position "junior"
    When I go to the certifications page
    Then I should see "Current User"
    And should see "Junior developer"
    And I should not see "John"
    And I should not see "Chris"

  Scenario: Regular user should not see links for managing certifications
    Given I have "User" role
    And a certification exists with user: I, position: position "junior"
    When I go to the certifications page
    Then I should not see "Edit"
    And I should not see "Destroy"

  Scenario: Regular user should see link to mark & report on his certification
    Given I have "User" role
    And a certification exists with user: I, position: position "junior"
    When I go to the certifications page
    Then I should see "Report"
    And I should see "Mark"

  Scenario: Regular user should not see link to mark for finished certifications
    Given I have "User" role
    And a finished certification exists with user: I, position: position "junior"
    When I go to the certifications page
    Then I should not see "Mark"

  Scenario: Expert should not see link to mark for finished certifications where he participate as expert
    Given I have "Expert" role
    And a finished certification: "finished certification" exists with id: 3
    And I expert for the certification "finished certification"
    When I go to the certifications page
    Then I should not see "Mark" within "#certification_3"

