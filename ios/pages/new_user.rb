module Pages
  class NewUser
    def initialize
    end

    def goto_enter_code
      find_element(:accessibility_id, "Yes").click
      $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Log In").displayed? }        
      Pages::EnterCode.new
    end  
    
    def goto_welcome
      find_element(:accessibility_id, "No").click
      $wait.until { find_element(:accessibility_id, "Continue with Email").displayed? }
    end  
  end
end
