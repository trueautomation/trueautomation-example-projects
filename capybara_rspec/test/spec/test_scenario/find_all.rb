require 'spec_helper'
# require 'selenium-webdriver'

feature 'TrueAutomation.IO capybara example' do

  scenario 'Test example' do
    visit 'https://www.venus.com/products.aspx?BRANCH=7~72~6514~'
    sleep 5
    find(:xpath, ta('product_div', "(//div[@class='product-container'])[3]"))
    sleep 5

  end
end

