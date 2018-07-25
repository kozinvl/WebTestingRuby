require_relative '../items/base_page'
require_relative '../items/new_comment_page'
require_relative '../handlers/selenium_handlers'

# This class contains functions which provide interaction with page
class MainPage < BasePage
  # elements
  NEW_BUTTON = {id: 'newbutton'}.freeze
  EDIT_BUTTON = {xpath: "//input[@value='Edit..']"}.freeze
  STATUS = {id: 'SelectedStatus'}.freeze
  NUMBER = {link_text: 'Number'}.freeze
  APPLY = {id: 'applybutton'}.freeze
  FIRST_COLUMN = {xpath: ".//*[@class='webgrid-row-style'][1]//*[@class='textcolumn']"}.freeze
  REFRESH_COMMENT = {link_text: 'Comment Text'}.freeze
  WEB_GRID_FOOTER = {class: 'webgrid-footer'}.freeze
  PAGES_NUMBER_TAG = {tag_name: 'a'}.freeze
  PAGES_LINKS_ATTRIBUTE = 'href'.freeze
  TEXT_COLUMN_CLASS_NAME = {class_name: 'textcolumn'}.freeze

  def initialize(driver)
    super driver
    @handler = SeleniumHandlers.new driver
  end

  def new_comment_button
    if @handler.wait_element(NEW_BUTTON) && @handler.enabled_element?(NEW_BUTTON)
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
      options.each {|option| option.click if option.text == text}
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

  def collect_all_comments
    href = urls_of_all_pages(@driver)
    text_columns = []
    text_columns = collect_tabs(text_columns, @driver)
    href.each do |ref|
      @driver.get(ref)
      text_columns = collect_tabs(text_columns, @driver)
    end
    text_columns
  end


  private def urls_of_all_pages(driver)
    list_from_table = driver.find_element(WEB_GRID_FOOTER)
    list_of_urls = list_from_table.find_elements(PAGES_NUMBER_TAG)
    href = []
    @text_columns = []
    list_of_urls.each do |link|
      href.append(link.attribute(PAGES_LINKS_ATTRIBUTE))
    end
    href.uniq!
    href
  end

  private def collect_tabs(text_array, driver)
    array_of_columns = driver.find_elements(TEXT_COLUMN_CLASS_NAME)
    array_of_columns.each do |column|
      text_array.append(column.text)
    end
    text_array
  end

  private def take_text_from_column(column_array, text_array)
    column_array.each do |column|
      text_array.append(column.text)
    end
    text_array
  end
end
