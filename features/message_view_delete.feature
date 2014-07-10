Feature: Delete or show a message

  Background: 
    Given we have a logged-in user called "joe"
    And "joe" has messages in his inbox 
    And that we are on the message index page

  Scenario: A user views a message
    Given we select "show"
      And the user has a message from "joe" 
    Then we should see that message


  Scenario: A user deletes a message
      And we select "delete" 
    Then that message should be deleted
