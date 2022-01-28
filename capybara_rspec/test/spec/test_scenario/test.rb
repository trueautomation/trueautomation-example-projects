# require 'spec_helper'
require 'selenium-webdriver'

# feature 'TrueAutomation.IO capybara example' do
#
#   scenario 'Test example' do
    driver = Selenium::WebDriver::Driver.for(:chrome)

    driver.get('https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_ondblclick')
    # visit 'https://app.trueautomation.io'
    sleep 10
    driver.switch_to.frame("iframeResult")

    puts "wedewd"

    # driver.find_element(:css, 'div.sign-up-container > a').click
    el = driver.find_element(:css, 'body')
    # driver.action.double_click(el).perform
    driver.action.move_to(el).double_click.perform
sleep 2

    # find(:css, ta("trueautomation:sign_UP", 'div.sign-up-container > a')).click
    # find(:xpath, ta("trueautomation:sign_IN", "//a[text()='Sign in']")).click
#   end
# end

