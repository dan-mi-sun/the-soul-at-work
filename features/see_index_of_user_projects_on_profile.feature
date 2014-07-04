Feature: view an index of buyer projects on their profile feature

  Background: 
    Given a buyer exists
      And a buyer has projects
      And a buyer signs in

  Scenario: a buyer views thier projects on their profile
    Given that the buyer is on their profile
    Then they should see the project displayed on their profile

