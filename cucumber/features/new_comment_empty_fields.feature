Feature: Create a new comment. All fields are empty

  @test_1
  Scenario: User create and save a new comment with empty fields
    Given User creates a new comment
    When 'Save & return' a new comment
    Then  Verify error message 'The Comment Text field is required.'

  @test_2
  Scenario: User come to the site. Create new comment and fill only "Comment text field" and save it
    Given User creates a new comment
    When User fill only 'Comment text field'
    And 'Save & return' a new comment
    Then  Verify error message 'Please, select at least one category'

  @test_3
  Scenario: User come to the site. Create new comment and fill "Comment text field" and enter
  non-unique number to "Number" field save it
    Given User creates a new comment
    When User fill 'Comment text field' and 'Number'
    And 'Save & return' a new comment
    Then  Verify error message 'Number field should be unique of empty'

#  new_comment_empty_fields.feature