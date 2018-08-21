require 'rspec'
require 'appium_lib'

def setup_driver
    return if $driver

    caps = Appium.load_appium_txt file: File.join(Dir.pwd, '../ios/appium.txt')
    Appium::Driver.new caps, true
  
    $wait = Selenium::WebDriver::Wait.new(:timeout => 30)
end

def promote_methods
    Appium.promote_singleton_appium_methods Pages
    Appium.promote_appium_methods RSpec::Core::ExampleGroup
  end

setup_driver
promote_methods

RSpec.configure do |config|
  config.before(:all) do
    $driver.start_driver
    alert_dismiss
  end
  config.after(:all) do
    driver_quit
  end
end