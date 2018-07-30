require_relative '../../../page_object_testing/items/main_page'
require_relative '../../../page_object_testing/items/new_comment_page'
require_relative '../../../page_object_testing/resource/test_data'

Given(/^User creates a new comment$/) do
  @driver = Selenium::WebDriver.for(:chrome)
  @driver.get(Url::SITE)
  @main_page = MainPage.new @driver
  @new_comment_page = @main_page.new_comment_button
end

When(/^User save a new comment$/) do
  @new_comment_page
      .save_n_return_condition
end

Given(/^User fill only 'Comment text field'$/) do
  @new_comment_page.filling_text(TEST_COMMENT_TEXT)
end

Given(/^User fill 'Comment text field' and 'Number'$/) do
  @new_comment_page
      .filling_text(TEST_COMMENT_TEXT)
      .filling_number(NON_VALID_TEST_NUMBER)
end

When(/^'Save & return' a new comment$/) do
  @new_comment_page
      .save_n_return_condition
end

Then(/^Verify error message 'The Comment Text field is required\.'$/) do
  expect(@new_comment_page.check_error).to include(ERROR_EMPTY_COMMENT_TEXT)
end

Then(/^Verify error message 'Please, select at least one category'$/) do
  expect(@new_comment_page.check_error).to include(ERROR_EMPTY_CATEGORIES)
end

Then(/^Verify error message 'Number field should be unique of empty'$/) do
  expect(@new_comment_page.check_error).to include(ERROR_NON_UNIQUE_NUMBER)
end


And(/^Close browser$/) do
  @driver.quit
end