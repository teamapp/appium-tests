require 'rspec'
require 'appium_lib'

def setup_driver
  return if $driver

  caps = Appium.load_appium_txt file: File.join(Dir.pwd, '../ios/appium.txt')
  $driver = Appium::Driver.new caps, true

  $wait = Selenium::WebDriver::Wait.new(:timeout => 30)
end

def promote_methods
  Appium.promote_appium_methods Object
  Appium.promote_appium_methods RSpec::Core::ExampleGroup
end

setup_driver
promote_methods

RSpec.configure do |config|
  config.before(:each) do
    $driver.start_driver
    alert_dismiss
  end
  config.after(:each) do
    $driver.driver_quit
  end
end