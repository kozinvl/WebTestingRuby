require_relative '../resource/url'


# Basic Page for all site
class BasePage

  def initialize(driver)
    @driver = driver
  end

  def get_home_page
    @driver.get(Url::SITE)
  end

  def get_title_page
    @driver.title
  end


end