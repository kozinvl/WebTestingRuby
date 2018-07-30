Feature: Create a new comment. All fields are empty

  @scenario
  Scenario: User come to the site. Create and save a new comment with empty fields
    Given User creates a new comment
    When User save a new comment
    Then  Verify error message

  Scenario: User come to the site. Create new comment and fill only "Comment text field" and save it
    Given User fill only 'Comment text field'
    When 'Save & return' a new comment
    Then  Verify another error message