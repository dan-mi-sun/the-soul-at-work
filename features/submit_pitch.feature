Feature: Submit a pitch feature 

  Background: 
    Given a creative exists
      And a creative signs in
      And a project exists
      And the creative is on the project page
      
  Scenario: Submit a pitch to a project
    When they choose start a pitch 
    Then then they should be taken to the edit pitch page
      And when they complete the form
    Then their pitch should be submitted
