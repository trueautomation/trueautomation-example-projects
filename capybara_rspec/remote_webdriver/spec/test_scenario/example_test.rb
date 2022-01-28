require_relative '../spec_helper'

feature 'TrueAutomation.IO Capybara example' do
  scenario 'Test example' do
    visit 'https://app.trueautomation.io/'

    find(:xpath, ta('homePage:loginBtn', "//a[.//span[text()='Login']]")).click
    find(:css, ta('signinPage:signupBtn', 'div.sign-up-container > a')).click
    fill_in ta('signupPage:emailField', 'email'), with: 'your@mail.com'
  end
end
