require_relative '../items/base_page'
# This class contains functions which provide interaction with page
class CommentsPage < BasePage
  INPUT_FIELD = {id: 'Text'}.freeze
  NUMBER_FIELD = {id: 'Number'}.freeze
  CATEGORY = {xpath: ".//*[@id='Categories'][@name='Categories'][@value = 6]"}.freeze
  ALL_CATEGORIES = {name: 'AllSelect'}.freeze
  CONFIRM_CATEGORY = {name: 'CurSelect'}.freeze
  SAVE_BUTTON = {xpath: ".//*/input[@value='Save']"}.freeze
  SAVE_AND_RETURN_BUTTON = {css: '#editor-navigation > input:nth-child(3)'}.freeze
  RETURN = {link_text: 'Return'}.freeze
  CHECKBOX_STATUS = {id: 'Active'}.freeze
  ERROR_FIELD = {id: 'errorfield'}.freeze

  def initialize(driver, handler)
    super driver
    @handler = handler
  end

  def filling_text(text, is_filled = false)
    @handler.wait_element(INPUT_FIELD)
    @handler.enabled_element?(INPUT_FIELD)
    @driver.find_element(INPUT_FIELD).clear if is_filled
    @driver.find_element(INPUT_FIELD).send_keys text
    self
  end

  def filling_number(number, is_filled = false)
    @handler.wait_element(NUMBER_FIELD)
    @handler.enabled_element?(NUMBER_FIELD)
    @driver.find_element(NUMBER_FIELD).clear if is_filled
    @driver.find_element(NUMBER_FIELD).send_keys number
    self
  end

  def chose_one_category
    @handler.enabled_element?(CONFIRM_CATEGORY)
    @driver.find_element(CATEGORY).click
    @driver.find_element(CONFIRM_CATEGORY).click
    self
  end

  def chose_all_categories
    @driver.find_element(ALL_CATEGORIES).click
    self
  end

  def save_condition
    @handler.enabled_element?(SAVE_BUTTON)
    @driver.find_element(SAVE_BUTTON).click
    self
  end

  def save_n_return_condition
    @handler.enabled_element?(SAVE_AND_RETURN_BUTTON)
    @driver.find_element(SAVE_AND_RETURN_BUTTON).click
    self
  end

  def return
    @driver.find_element(RETURN).click
    MainPage.new @driver
  end

  def checkbox_status
    @driver.find_element(CHECKBOX_STATUS).click
    self
  end

  def check_error
    @driver.find_element(ERROR_FIELD).text
  end
end
