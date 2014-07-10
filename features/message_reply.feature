Feature: Reply to a message

  Background: 
    Given we have a logged-in user called "joe"
      And "joe" has messages in his inbox 

  Scenario: A user replies to a message
    Given that we are on the show message page
    When we click on the reply option
    Given that we have written "cucumber test message" in the reply message
    When we click on "send" button below the message
    Then our message containing "cucumber test message" is sent to the sender of the original message
