require_relative '../items/base_page'
require_relative '../items/new_comment_page'
require_relative '../handlers/selenium_handlers'


# This class contains functions which provide interaction with page
class MainPage < BasePage
  # elements
  NEW_BUTTON = {id: 'newbutton'}
  EDIT_BUTTON = {xpath: "//input[@value='Edit..']"}
  STATUS = {id: 'SelectedStatus'}
  NUMBER = {link_text: 'Number'}
  APPLY = {id: 'applybutton'}
  FIRST_COLUMN = {xpath: ".//*[@class='webgrid-row-style'][1]//*[@class='textcolumn']"}
  REFRESH_COMMENT = {link_text: 'Comment Text'}


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
    @handler.enabled_element?(NUMBER)
    @driver.find_element(NUMBER).click
    self
  end

  def change_status(text)
    if @handler.enabled_element?(STATUS)
      element = @driver.find_element(STATUS)
      options = element.find_elements(tag_name: 'option')
      options.each { |option| option.click if option.text == text }
    end
    self
  end

  def apply
    if @handler.enabled_element?(APPLY)
      @driver.find_element(APPLY).click
    end
    self
  end

  def get_first_column
    comment_text = @driver.find_element(FIRST_COLUMN).text
  end

  def select_choose_box(value)
    @handler.enabled_element?(xpath: "//input[@value='#{value}']")
    @driver.find_element(xpath: "//input[@value='#{value}']").click
    self
  end

  def edit_button
    @handler.enabled_element?(EDIT_BUTTON)
    @driver.find_element(EDIT_BUTTON).click
    CommentsPage.new @driver, @handler
  end

  def refresh_by_comment_text
    @driver.find_element(REFRESH_COMMENT).click
    self
  end

end