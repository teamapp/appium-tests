require_relative '../ios/pages/welcome'
require_relative '../ios/pages/enter_email'
require_relative '../ios/pages/enter_password'
require_relative '../ios/pages/new_user'
require_relative '../ios/pages/enter_code'
require_relative '../ios/pages/consent'

require_relative 'spec_helper'

require 'securerandom'

describe 'login' do
    before(:each) do        
        $wait.until { $driver.find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Team App").displayed? }
        $driver.find_element(:accessibility_id, "LOG IN").click
    end

    after(:each) do
    end   
    
    it 'should login user with email and password' do
        welcome = Pages::Welcome.new()

        enter_email = welcome.goto_enter_email
        enter_email.enter_email('admin@simple.com')

        enter_password = enter_email.goto_enter_password
        enter_password.enter_password('password')

        enter_password.goto_clubs
    end

    it 'should login user with email and no password' do
        welcome = Pages::Welcome.new()

        enter_email = welcome.goto_enter_email
        enter_email.enter_email('chamitha@teamapp.com')

        enter_code = enter_email.goto_enter_code

        # TODO: 
    end

    it 'should create user with email' do
        welcome = Pages::Welcome.new()

        enter_email = welcome.goto_enter_email
        enter_email.enter_email(SecureRandom.hex(10) + '@simple.com')  
        
        new_user = enter_email.goto_new_user
        new_user.goto_enter_code

        # TODO:
    end
end