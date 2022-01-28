require 'bundler/setup'
require 'ostruct'
require 'selenium-webdriver'
require 'rspec'
require 'rspec-steps'
require 'capybara/rspec'
require 'true_automation/rspec'
require 'true_automation/driver/capybara'

RSpec.configure do |config|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--incognito')

  options = Selenium::WebDriver::Chrome::Options.new
  # options.binary = "/Downloads/Firefox.app/Contents/MacOS/firefox-bin"
  options.binary = "/Applications/Google Chrome.app/Contents/MacOS"

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

feature 'TrueAutomation.IO Capybara example' do
  scenario 'Test example' do
    visit 'https://app.trueautomation.io/'

    find(:xpath, ta('homePage:loginBtn', "//a[.//span[text()='Login']]")).click
    find(:css, ta('signinPage:backBtn', 'a > svg')).click
    fill_in ta('signupPage:emailField', 'email'), with: 'your@mail.com'

    sleep 3
  end
end