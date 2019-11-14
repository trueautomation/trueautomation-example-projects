require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Test example' do
    visit 'https://trueautomation.io/'

    find(:xpath, ta('trueautomationio:home:login_btn', "//a[contains(., 'Login')]")).click
    find(:css, ta('trueautomationio:signin:signup_btn', 'div.sign-up-container > a')).click
    fill_in ta('trueautomationio:signup:email', 'email'), with: 'your@gmail.com'
    #
    # find(:xpath, ta('button1')).click
    # sleep 3
    # find(:css, ta('button2')).click
    # sleep 3
    # fill_in ta('field'), with: 'your@gmail.com'
    # sleep 3
  end
end
