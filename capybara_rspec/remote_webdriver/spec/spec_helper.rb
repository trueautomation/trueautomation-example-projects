require 'bundler/setup'
require 'selenium-webdriver'
require 'rspec'
require 'rspec-steps'
require 'capybara/rspec'
require 'true_automation/rspec'
require 'true_automation/driver/capybara'

RSpec.configure do |config|
  # Using Chrome browser options
  # options = Selenium::WebDriver::Chrome::Options.new
  # options.add_argument('--incognito')
  # options.binary = "/Applications/Google Chrome.app/Contents/MacOS"

  # Using Firefox browser options
  # options = Selenium::WebDriver::Firefox::Options.new
  # options.binary = "/Applications/Firefox.app/Contents/MacOS/firefox-bin"
  # options.binary = "/Users/stegrial/Downloads/Firefox.app/Contents/MacOS/firefox-bin"

  # Chrome capabilities
  # caps = Selenium::WebDriver::Remote::Capabilities.chrome
  # caps['goog:chromeOptions'] = {}
  # caps['goog:chromeOptions']['binary'] = "/Applications/Google Chrome.app/Contents/MacOS"

  # Firefox capabilities
  # caps = Selenium::WebDriver::Remote::Capabilities.firefox
  # caps['moz:firefoxOptions'] = {}
  # caps['moz:firefoxOptions']['binary'] = "/Users/stegrial/Downloads/Firefox.app/Contents/MacOS/firefox-bin"

  # Using Selenium without TA (browser specified)
  # Capybara.register_driver :true_automation_driver do |app|
  #   Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
  # end

  # Using Selenium without TA (remote webdriver)
  # Capybara.register_driver :true_automation_driver do |app|
  #     Capybara::Selenium::Driver.new(app, browser: :remote, url: 'http://localhost:4444', desired_capabilities: caps)
  # end

  # Using TA (remote web driver)
  Capybara.register_driver :true_automation_driver do |app|
    TrueAutomation::Driver::Capybara.new(app, browser: :remote, url: 'http://localhost:4444')
  end

  Capybara.configure do |capybara|
    capybara.run_server = false
    capybara.default_max_wait_time = 5

    capybara.default_driver = :true_automation_driver
  end

  config.include Capybara::DSL
  config.include TrueAutomation::DSL
end
