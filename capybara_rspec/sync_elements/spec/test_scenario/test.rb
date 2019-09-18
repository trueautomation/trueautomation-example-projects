require 'spec_helper'

feature 'TrueAutomation.IO capybara example' do

  1000.times do |i|
    scenario 'Test example' do
      visit 'https://app.trueautomation.io'

      find(:css, ta("trueautomation:sign_UP#{i + 1}", 'div.sign-up-container > a')).click
      sleep 1
      find(:xpath, ta("trueautomation:sign_IN#{i + 1}", "//a[text()='Sign in']")).click
      sleep 1
    end
  end
end
