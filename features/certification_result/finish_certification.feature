Feature: Finish certification
  In order to make decision based on marks
  As a HR
  I want to finish certification with some notes
  
  Background:
    Given I am an authenticated user
    And a certification exists with user: I

  Scenario: HR should be able to see finish link on the certification report
    Given I have "HR" role
    When I am on the user's certification's certification reports page
    Then I should see "Finish"

  Scenario Outline: Regular user should not be able to see finish link on the certification report
    Given I have "<role>" role
    When I am on the user's certification's certification reports page
    Then I should not see "Finish"
    Examples:
      | role   |
      | User   |
      | Expert |

  Scenario: HR finish certification
    Given I have "HR" role
    And I am on the certification's edit results page
    When I fill in "Result" with "OK"
    And press "Yes, finish this certification"
    Then I should be on the certifications page
    And a certification should exist with result: "OK"
    And a certification should be finished
