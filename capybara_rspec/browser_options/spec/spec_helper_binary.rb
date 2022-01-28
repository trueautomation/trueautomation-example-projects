require 'bundler/setup'
require 'ostruct'
require 'selenium-webdriver'
require 'rspec'
require 'rspec-steps'
require 'capybara/rspec'
require 'true_automation/rspec'
require 'true_automation/driver/capybara'

RSpec.configure do |config|
  options = Selenium::WebDriver::Firefox::Options.new
  # options.binary = "/Applications/Firefox.app/Contents/MacOS/firefox-bin"
  options.binary = "/Users/stegrial/Documents/TrueAutomation/General-test-projects/trueautomation-example-projects/capybara_rspec/browser_options/browser/Firefox.app/Contents/MacOS"

  # options = Selenium::WebDriver::Chrome::Options.new
  # options.binary = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
  # options.binary = "/Users/stegrial/Documents/TrueAutomation/General-test-projects/trueautomation-example-projects/capybara_rspec/browser_options/browser/Google Chrome.app/Contents/MacOS"

  Capybara.register_driver :true_automation_driver do |app|
    Capybara::Selenium::Driver.new(app, options: options)
  end

  # Capybara.register_driver :true_automation_driver do |app|
  #   TrueAutomation::Driver::Capybara.new(app, options: options)
  # end

  Capybara.configure do |capybara|
    capybara.run_server = false
    capybara.default_max_wait_time = 5

    capybara.default_driver = :true_automation_driver
  end

  config.include Capybara::DSL
  config.include TrueAutomation::DSL
end
