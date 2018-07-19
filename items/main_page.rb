require_relative '../items/base_page'
require_relative '../items/new_comment_page'
require_relative '../handlers/selenium_handlers'


# This class contains functions which provide interaction with page
class MainPage < BasePage
  # elements
  NEW_BUTTON = {id: 'newbutton'}
  STATUS = {id: 'SelectedStatus'}
  NUMBER = {link_text: 'Number'}
  APPLY = {id: 'applybutton'}
  FIRST_COLUMN = {xpath: ".//*[@class='webgrid-row-style'][1]//*[@class='textcolumn']"}


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

  def sort_by_number
    @driver.find_element(NUMBER).click
    self
  end

  def change_status(text)
    if @handler.enabled_element?(STATUS)
      element = @driver.find_element(STATUS)
      options = element.find_elements(tag_name: 'option')
      options.each {|option| option.click if option.text == text}
    end
    self
  end

  def apply
    @driver.find_element(APPLY).click
    self
  end

  def get_first_column
    text = @driver.find_element(FIRST_COLUMN).text
    p text
    sleep 4
  end


end