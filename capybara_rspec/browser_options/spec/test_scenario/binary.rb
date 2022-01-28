require_relative '../spec_helper_binary'

feature 'TrueAutomation.IO Capybara example' do
  scenario 'Test example' do
    visit 'https://app.trueautomation.io/'

    find(:xpath, ta('homePage:loginBtn', "//a[.//span[text()='Login']]")).click
    find(:css, ta('signinPage:backBtn', 'a > svg')).click
    fill_in ta('signupPage:emailField', 'email'), with: 'your@mail.com'

    sleep 3
  end
end