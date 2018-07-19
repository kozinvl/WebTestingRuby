require 'test/unit'
require 'selenium-webdriver'
require_relative 'resource/url'
require_relative 'items/main_page'

# Class include tests to testing web site
class TestCommentsPage < Test::Unit::TestCase
  def setup
    @driver = Selenium::WebDriver.for(:chrome)
    @driver.get(Url::SITE)
    @main_page = MainPage.new @driver
  end

  def test_title_page
    @actual_title = @main_page.get_title_page
    expected_title = 'Index'
    assert_equal(@actual_title, expected_title)
  end

  def test_new_comment
    actually_comment = @main_page.new_comment_button
                                 .filling_text('New Comment Row')
                                 .chose_one_category
                                 .save_condition
                                 .return
                                 .change_status('All')
                                 .apply
                                 .sort_by_number
                                 .get_first_column
    assert(actually_comment, 'New Comment Row')

  end

  def teardown
    @driver.quit
  end
end
