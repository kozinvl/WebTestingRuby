require_relative '../items/base_page'
# This class contains functions which provide interaction with page
class CommentsPage < BasePage
  INPUT_FIELD = {id: 'Text'}
  CATEGORY = {xpath: ".//*[@id='Categories'][@name='Categories'][@value = 6]"}
  CONFIRM_CATEGORY = {name: 'CurSelect'}
  SAVE_BUTTON = {xpath: ".//*/input[@value='Save']"}
  RETURN = {link_text: 'Return'}


  def initialize(driver)
    super driver
  end

  def filling_text(text)
    wait_element(INPUT_FIELD)
    @driver.find_element(INPUT_FIELD).send_keys text
    self
  end

  def chose_one_category
    @driver.find_element(CATEGORY).click
    @driver.find_element(CONFIRM_CATEGORY).click
    self
  end

  def save_condition
    @driver.find_element(SAVE_BUTTON).click
    self
  end

  def return
    @driver.find_element(RETURN).click
    self
  end


end