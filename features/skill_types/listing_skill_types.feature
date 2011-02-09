Feature: Listing skill types
  In order to review existing skill types
  As a authenticated user
  I want to browse skill types

  Background:
     Given I am an authenticated user
     And skill_type exists with name: "Communication"
     And another skill_type exists with name: "Initiative"
     And I am on the home page

   Scenario: Admin should be able to manage skill types
     Given I have "Admin" role
     When I am on the skill_types page
     Then I should see "Edit"
     And I should see "Destroy"
     And I should see "New skill type"

   Scenario Outline: All users should be able to list skill types
     Given I have "<role>" role
     Then I should see "Skill types"
     When I follow "Skill types"
     Then I should be on the skill_types page
     Then I should see "Communication"
     And I should see "Initiative"

     Examples:
       | role |
       | User |
       | HR |
       | Admin |

   Scenario Outline: Regular users should not see links for managing skill types
     Given I have "<role>" role
     When I am on the skill_types page
     Then I should not see "Edit"
     And I should not see "Destroy"
     And I should not see "New Skill type"

     Examples:
       | role |
       | User |
       | HR |

   Scenario: Visitor should not be able to list skill types
     Given I am logged out
     When I go to the skill_types page
     Then access should be denied via authentication rule

 