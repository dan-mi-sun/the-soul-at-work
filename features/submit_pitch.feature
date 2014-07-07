Feature: Submit a pitch feature 

  Background: 
    Given a user exists
      And a user signs in
      And a project exists
      And the user is on the project page
      
  Scenario: Submit a pitch to a project
    When they choose start a pitch 
    Then then they should be taken to the edit pitch page
      And when they complete the form
    Then their pitch should be submitted
