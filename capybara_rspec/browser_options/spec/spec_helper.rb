require 'bundler/setup'
require 'ostruct'
require 'selenium-webdriver'
require 'rspec'
require 'rspec-steps'
require 'capybara/rspec'
require 'true_automation/rspec'
require 'true_automation/driver/capybara'

RSpec.configure do |config|
  options = Selenium::WebDriver::Firefox::Options.new(binary: "/Applications/Firefox.app/Contents/MacOS/firefox-bin")
  # options.add_argument('--disable-dev-shm-usage')
  # options.binary = '/Applications/Google Chrome.app/Contents/MacOS'

  # caps_chrome = Selenium::WebDriver::Remote::Capabilities.chrome
  # caps_chrome['goog:chromeOptions'] = {}
  # caps_chrome['goog:chromeOptions']['binary'] = "/Applications/Google Chrome.app/Contents/MacOS"

  # Capybara.register_driver :true_automation_driver do |app|
  #   Capybara::Selenium::Driver.new(app, options: options)
  # end

  Capybara.register_driver :true_automation_driver do |app|
    TrueAutomation::Driver::Capybara.new(app, options: options)
  end

  Capybara.configure do |capybara|
    capybara.run_server = false
    capybara.default_max_wait_time = 5

    capybara.default_driver = :true_automation_driver
  end

  config.include Capybara::DSL
  config.include TrueAutomation::DSL
end
