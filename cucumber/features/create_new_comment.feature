Feature: Add new comment

  @scenario
  Scenario: User come to the site create and save a new comment
    Given I create a new comment
    When I save a new comment
    Then  I verify that comment is present