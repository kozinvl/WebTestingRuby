Feature: Create a new comment. All fields are empty

  @scenario
  Scenario: User come to the site create and save a new comment with empty fields
    Given User creates a new comment
    When User save a new comment
    Then  Verify error message