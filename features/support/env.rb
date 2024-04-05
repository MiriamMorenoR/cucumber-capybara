# frozen_string_literal: true

require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'

@browser = ENV['BROWSER']

case @browser
when 'firefox'
  @driver = :selenium
when 'firefox_headless'
  @driver = :selenium_headless
when 'safari'
  @driver = :safari
when 'chrome', 'chrome_headless'
  @driver = :chrome
else
  @driver = :selenium_chrome
  @browser = 'chrome default'
end

Capybara.configure do |config|
  config.default_driver = @driver
  config.app_host = 'https://react-shopping-cart-67954.firebaseapp.com/'
  config.default_max_wait_time = 5
end

puts "Testes sendo executados no navegador #{@browser}"
