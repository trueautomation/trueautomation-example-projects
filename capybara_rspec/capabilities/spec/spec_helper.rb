require 'bundler/setup'
require 'ostruct'
require 'selenium-webdriver'
require 'rspec'
require 'rspec-steps'
require 'capybara/rspec'
require 'true_automation/rspec'
require 'true_automation/driver/capybara'

RSpec.configure do |config|
  # options = Selenium::WebDriver::Firefox::Options.new
  # options.binary = "/Applications/Firefox.app/Contents/MacOS/firefox-bin"
  # options.binary = "/Users/stegrial/Downloads/Firefox.app/Contents/MacOS/firefox-bin"

  # caps = Selenium::WebDriver::Remote::Capabilities.chrome
  # caps['goog:chromeOptions'] = {}
  # caps['goog:chromeOptions']['binary'] = "/Applications/Google Chrome.app/Contents/MacOS"

  caps = Selenium::WebDriver::Remote::Capabilities.firefox
  caps['moz:firefoxOptions'] = {}
  caps['moz:firefoxOptions']['binary'] = "/Users/stegrial/Downloads/Firefox.app/Contents/MacOS/firefox-bin"

  # Capybara.register_driver :true_automation_driver do |app|
  #   Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
  # end

  # Capybara.register_driver :true_automation_driver do |app|
  #     Capybara::Selenium::Driver.new(app, browser: :remote, url: 'http://localhost:4444', desired_capabilities: caps)
  # end

  Capybara.register_driver :true_automation_driver do |app|
    TrueAutomation::Driver::Capybara.new(app, desired_capabilities: caps)
  end

  Capybara.configure do |capybara|
    capybara.run_server = false
    capybara.default_max_wait_time = 5

    capybara.default_driver = :true_automation_driver
  end

  config.include Capybara::DSL
  config.include TrueAutomation::DSL
end
