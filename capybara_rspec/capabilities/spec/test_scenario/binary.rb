require 'spec_helper'

feature 'TrueAutomation.IO Capybara example' do
  scenario 'Test example' do
    visit 'https://app.trueautomation.io/'
    sleep 30

    find(:xpath, ta('homePage:loginBtn', "//a[.//span[text()='Login']]")).click
    find(:css, ta('signinPage:backBtn', 'a > svg')).click
    fill_in ta('signupPage:emailField', 'email'), with: 'your@mail.com'

    sleep 3
  end
end