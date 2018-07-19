require_relative '../resource/url'
require 'logger'
$LOG = Logger.new STDOUT
$LOG.level = Logger::INFO
$LOG.formatter = proc do |severity, time, progname, msg|
  "\n #{time}: #{msg} \n"
end


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

  def wait_element(locator)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    result_item = wait.until { @driver.find_element(locator).displayed? }
    $LOG.info("Element was found?: #{result_item}")
  end

end