Feature: Listing positions
  In order to review existing positions
  As a CTO or HR
  I want to browse positions

  Background:
    Given I am an authenticated user
    And I am on the home page

  Scenario: Listing positions
    Given position exists with name: "Junior developer"
    And another position exists with name: "Senior developer"
    When I follow "Positions"
    Then I should be on the positions page
    And I should see "Junior developer"

