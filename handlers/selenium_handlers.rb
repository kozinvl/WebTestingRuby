require 'logger'
$LOG = Logger.new STDOUT
$LOG.level = Logger::INFO
$LOG.formatter = proc do |severity, time, progname, msg|
  "\n #{time}: #{msg} \n"
end
# Selenium Wrapper
class SeleniumHandlers
  def initialize(driver)
    @driver = driver
  end

  def wait_element(locator)
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    result_item = wait.until {@driver.find_element(locator).displayed?}
    $LOG.info("Element was found?: #{result_item}")
  end

  def enabled_element?(locator)
    result_item = @driver.find_element(locator).enabled?
    $LOG.info("Element was enabled?: #{result_item}")
  end

end