Feature: Profile page

  Scenario: A visitor sees a profile 
    Given a user exists
      And a user signs in
      And We are in the profile page
    Then We should see the user's username
      And We should see the user's about
      And We should see the user's location
      And We should see the user's langauges
      And We should see the user's skills
