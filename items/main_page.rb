require_relative '../items/base_page'
require_relative '../items/new_comment_page'
require_relative '../handlers/selenium_handlers'


# This class contains functions which provide interaction with page
class MainPage < BasePage
  # elements
  NEW_BUTTON = {id: 'newbutton'}

  def initialize(driver)
    super driver
    @handler = SeleniumHandlers.new driver
  end

  def new_comment_button
    if @handler.wait_element NEW_BUTTON and @handler.enabled_element?(NEW_BUTTON)
      @driver.find_element(NEW_BUTTON).click
    end
    CommentsPage.new @driver, @handler
  end

end