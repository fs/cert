Feature: Create new certification for user
  In order to test developer's skills
  As an admin or HR
  I want to create new certification for user

  Background:
    Given I am an authenticated user
    And a position: "junior" exists with name: "Junior developer"
    And a confirmed user: "chris" exists with full_name: "Chris"

  Scenario Outline: Admin or HR creates new certification for Chris on Junior developer position
    Given I have "<role>" role
    And a confirmed user: "timur" exists with full_name: "Timur"
    And user: "timur" has role: "Expert"
    When I am on the new certification page
    And I select "Junior developer" from "Position"
    And I select "Chris" from "User"
    And I check "Timur"
    And I press "Create Certification"
    Then 1 certifications should exist with position: position "junior", user: user "chris"
    And user "timur" should be in the certification's experts

      Examples:
        | role  |
        | Admin |
        | HR    |

  Scenario: Visitor should not be able to create new certification with direct request
    Given I am logged out
    When I send "POST" request to the certifications page
    Then access should be denied via authentication rule

  Scenario: Regular users should not be able to create new skill with direct request
    Given I have "User" role
    When I send "POST" request to the certifications page
    Then access should be denied via authorization rule