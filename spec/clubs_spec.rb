require_relative '../ios/pages/clubs'
require_relative 'spec_helper'

describe 'clubs' do
    before(:all) do
        find_element(:accessibility_id, "LOG IN").click
        $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Log In").displayed? }

        find_element(:accessibility_id, "user_auth[email]").type("chamitha@teamapp.com")
        find_element(:accessibility_id, "user_auth[password]").type("Password1")
        find_element(:accessibility_id, "Submit").click
        
        $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Team App").displayed? }        
    end

    after(:each) do
    end    

    it 'should create new club' do
        clubs.click_create
    end

end