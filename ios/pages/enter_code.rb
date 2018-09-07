module Pages
  class EnterCode
    def initialize
    end

    def enter_code(code)
      find_element(:accessibility_id, "user_session[security_code]").type(code)
    end   
    
    def goto_clubs
      find_element(:accessibility_id, "Submit").click
      $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Team App").displayed? }        
    end 
    
    def goto_user_profile
      find_element(:accessibility_id, "Submit").click
      $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "User Profile").displayed? }        
      Pages::UserProfile.new
    end 
  end
end