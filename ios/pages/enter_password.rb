module Pages
  class EnterPassword
    def initialize
    end

    def enter_password(password)
      find_element(:accessibility_id, "user_session[password]").type(password)
      hide_keyboard
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
  end
end