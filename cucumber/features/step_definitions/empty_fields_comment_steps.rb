require_relative '../../../page_object_testing/items/main_page'
require_relative '../../../page_object_testing/items/new_comment_page'
require_relative '../../../page_object_testing/resource/test_data'

Given(/^User creates a new comment$/) do
  @new_comment_page = init_driver
end

When(/^User save a new comment$/) do
  @new_comment_page
      .save_n_return_condition
end

Then(/^Verify error message$/) do
  expect(@new_comment_page.check_error).to include(ERROR_EMPTY_COMMENT_TEXT)
end

Given(/^User fill only 'Comment text field'$/) do
  @new_comment_page = init_driver
  @new_comment_page.filling_text(TEST_COMMENT_TEXT)
end

When(/^'Save & return' a new comment$/) do
  @new_comment_page
      .save_n_return_condition
end

Then(/^Verify another error message$/) do
  expect(@new_comment_page.check_error).to include(ERROR_EMPTY_CATEGORIES)
end

private def init_driver
  @driver = Selenium::WebDriver.for(:chrome)
  @driver.get(Url::SITE)
  @main_page = MainPage.new @driver
  @main_page.new_comment_button
end