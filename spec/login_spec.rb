require_relative 'spec_helper'

describe 'login' do
    before(:each) do
        find_element(:accessibility_id, "LOG IN").click
        $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Log In").displayed? }
    end

    after(:each) do
    end    

    it 'should show invalid email or password' do
        find_element(:accessibility_id, "user_auth[email]").type("fubar@teamapp.com")
        find_element(:accessibility_id, "user_auth[password]").type("Fubar123")
        find_element(:accessibility_id, "Submit").click

        $wait.until { find_ele_by_attr("XCUIElementTypeAlert", "name", "Please Review").displayed? }

        expect(find_element(:xpath, "//XCUIElementTypeAlert//XCUIElementTypeStaticText[2]").text).to eq "Email or password is not correct"

        alert_dismiss
        find_element(:accessibility_id, "Cancel").click
    end

    it 'should succeed' do
        find_element(:accessibility_id, "user_auth[email]").type("chamitha@teamapp.com")
        find_element(:accessibility_id, "user_auth[password]").type("Password1")
        find_element(:accessibility_id, "Submit").click
        
        $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Team App").displayed? }        
    end

end