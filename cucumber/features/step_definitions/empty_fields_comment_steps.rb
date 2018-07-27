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

Then(/^Verify error message$/) do
  expect(@new_comment_page.check_error).to include(ERROR_EMPTY_COMMENT_TEXT)
end