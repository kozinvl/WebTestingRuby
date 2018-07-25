require_relative '../../../page_object_testing/items/main_page'
require_relative '../../../page_object_testing/items/new_comment_page'
require_relative '../../../page_object_testing/resource/test_data'

Given(/^I create a new comment$/) do
  @driver = Selenium::WebDriver.for(:chrome)
  @driver.get(Url::SITE)
  @main_page = MainPage.new @driver
  @new_comment_page = @main_page.new_comment_button
end

When(/^I save a new comment$/) do
  @new_comment_page
    .filling_text(TEST_COMMENT_TEXT)
    .filling_number(TEST_NUMBER)
    .chose_all_categories
    .save_n_return_condition
end

Then(/^I verify that comment is present$/) do
  text_comments = @main_page.collect_all_comments
  expect(text_comments).to include(TEST_COMMENT_TEXT)
end
