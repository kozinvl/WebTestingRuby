require_relative '../../../page_object_testing/resource/url'
Given(/^I open a browser$/) do
  @browser = Selenium::WebDriver.for(:chrome)
end

When(/^I enter the side url$/) do
  @browser.navigate.to(Url::SITE)
end

Then(/^I verify main page is loaded$/) do
  p @browser.title
end