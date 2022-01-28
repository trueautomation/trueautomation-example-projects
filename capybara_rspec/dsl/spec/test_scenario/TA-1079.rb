require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do
  scenario 'Test example 1 - find method' do
    visit 'https://trueautomation.io/'
    click_link(ta('contains:text_link:login', 'Login'))
    # click_link('Login')
    sleep 3
  end
end