require_relative '../items/base_page'
# This class contains functions which provide interaction with page
class CommentsPage < BasePage
  INPUT_FIELD = {id: 'Text'}
  CATEGORY = {xpath: ".//*[@id='Categories'][@name='Categories'][@value = 6]"}
  CONFIRM_CATEGORY = {name: 'CurSelect'}
  SAVE_BUTTON = {xpath: ".//*/input[@value='Save']"}
  RETURN = {link_text: 'Return'}


  def initialize(driver, handler)
    super driver
    @handler = handler
  end

  def filling_text(text)
    @handler.wait_element(INPUT_FIELD)
    @handler.enabled_element?(INPUT_FIELD)
    @driver.find_element(INPUT_FIELD).send_keys text
    self
  end

  def chose_one_category
    @handler.enabled_element?(CONFIRM_CATEGORY)
    @driver.find_element(CATEGORY).click
    @driver.find_element(CONFIRM_CATEGORY).click
    self
  end

  def save_condition
    @handler.enabled_element?(SAVE_BUTTON)
    @driver.find_element(SAVE_BUTTON).click
    self
  end

  def return
    @driver.find_element(RETURN).click
    self
  end


end