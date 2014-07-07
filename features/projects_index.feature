Feature: Projects Index

  Background: 
      Given that I am on the project index page
      And more than one project exists

  Scenario: we should see a list of available projects 
      Then we should see a list of these projects
