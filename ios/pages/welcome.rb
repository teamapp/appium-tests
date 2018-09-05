module Pages
  class Welcome
    def goto_enter_email
      find_element(:accessibility_id, "Email/Password").click
      $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Log In").displayed? }        
      EnterEmail.new
    end    
  end    
end
