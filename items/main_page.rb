require_relative '../items/base_page'
require_relative '../items/new_comment_page'
# This class contains functions which provide interaction with page
class MainPage < BasePage
  # elements
  NEW_BUTTON = {id: 'newbutton'}

  def initialize(driver)
    super driver
  end

  def new_comment_button
    @driver.find_element(NEW_BUTTON).click
    CommentsPage.new @driver
  end

end