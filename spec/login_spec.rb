require_relative '../ios/pages/welcome'
require_relative '../ios/pages/enter_email'
require_relative '../ios/pages/enter_password'
require_relative '../ios/pages/new_user'
require_relative '../ios/pages/enter_code'
require_relative '../ios/pages/user_profile'
require_relative '../ios/pages/consent'

require_relative 'spec_helper'

require 'securerandom'

describe 'login' do
    before(:each) do        
    end

    after(:each) do
    end   
    
    it 'should login user with email and password' do
        welcome = Pages::Welcome.new()

        enter_email = welcome.goto_enter_email
        enter_email.enter_email('automation-test-user-1@teamapp.com')

        enter_password = enter_email.goto_enter_password
        enter_password.enter_password('password')

        enter_password.goto_clubs
    end

    it 'should login user with manual membership' do
        welcome = Pages::Welcome.new()

        enter_email = welcome.goto_enter_email
        enter_email.enter_email('automation-test-user-2@teamapp.com')

        enter_code = enter_email.goto_enter_code
        enter_code.enter_code('000000')
        user_profile = enter_code.goto_user_profile

        user_profile.select_year_of_birth
        user_profile.select_country
        consent = user_profile.goto_consent

        consent.accept_terms
        consent.goto_clubs
    end

    it 'should login user with email and no password' do
        welcome = Pages::Welcome.new()

        enter_email = welcome.goto_enter_email
        enter_email.enter_email('automation-test-user-3@teamapp.com')

        enter_code = enter_email.goto_enter_code

        enter_code.enter_code('000000')
        enter_code.goto_clubs
    end

    it 'should create user with email' do
        welcome = Pages::Welcome.new()

        enter_email = welcome.goto_enter_email
        enter_email.enter_email(SecureRandom.hex(10) + '@teamapp.com')  
        
        new_user = enter_email.goto_new_user
        enter_code = new_user.goto_enter_code

        enter_code.enter_code('000000')
        user_profile = enter_code.goto_user_profile

        user_profile.enter_name('Chuck Norris')
        user_profile.select_year_of_birth
        user_profile.select_country
        consent = user_profile.goto_consent

        consent.accept_terms
        consent.goto_clubs
    end

    it 'should not create user' do
        welcome = Pages::Welcome.new()

        enter_email = welcome.goto_enter_email
        enter_email.enter_email(SecureRandom.hex(10) + '@teamapp.com')  
        
        new_user = enter_email.goto_new_user
        new_user.goto_welcome
    end
end

describe 'forgot password' do
    before(:each) do        
    end

    after(:each) do
    end   
    
    it 'should login user with security code' do
        welcome = Pages::Welcome.new()

        enter_email = welcome.goto_enter_email
        enter_email.enter_email('automation-test-user-1@teamapp.com')

        enter_password = enter_email.goto_enter_password
        enter_code = enter_password.goto_enter_code

        enter_code.enter_code('000000')
        enter_code.goto_clubs
    end
end