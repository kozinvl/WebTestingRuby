require 'test-unit'
require 'selenium-webdriver'
require_relative 'resource/url'
require_relative 'items/main_page'

# Class include tests to testing web site
class TestCommentsPage < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for(:chrome)
    @driver.get(Url::SITE)
    @driver.manage.window.maximize
    @main_page = MainPage.new @driver
  end

  def test_title_page
    actual_title = @main_page.get_title_page
    expected_title = 'Index'
    assert_equal(expected_title, actual_title)
  end

  def test_new_comment
    actually_comment = @main_page
                           .new_comment_button
                           .filling_text('New Comment Row')
                           .chose_one_category
                           .save_condition
                           .return_to_main_page
                           .change_status('All')
                           .apply
                           .sort_by_number
                           .get_first_column
    assert_equal('New Comment Row', actually_comment)
  end

  def test_delete_comment
    actually_comment = @main_page
                           .select_choose_box(2)
                           .edit_button
                           .filling_text('ABC comment', true)
                           .checkbox_status
                           .chose_one_category
                           .save_condition
                           .return_to_main_page
                           .change_status('Active')
                           .apply
                           .sort_by_number
                           .refresh_by_comment_text
                           .get_first_column
    assert_equal('ABC comment', actually_comment)
  end

  def teardown
    @driver.quit
  end
end
