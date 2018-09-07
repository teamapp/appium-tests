module Pages
  class EnterPassword
    def initialize
    end

    def enter_password(password)
      find_element(:accessibility_id, "user_session[password]").type(password)
    end    

    def goto_consent
      find_element(:accessibility_id, "Submit").click
      $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Consent").displayed? }        
      Pages::Consent.new
    end       
    
    def goto_clubs
      find_element(:accessibility_id, "Submit").click
      $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Team App").displayed? }        
    end 
    
    def goto_enter_code
      find_element(:accessibility_id, "I have forgotten my password").click
      $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Log In").displayed? }        
      Pages::EnterCode.new
    end 
  end
end