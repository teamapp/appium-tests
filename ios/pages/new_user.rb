module Pages
  class NewUser
    def initialize
    end

    def goto_enter_code
      find_element(:accessibility_id, "Yes").click
      $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Log In").displayed? }        
      Pages::EnterCode.new
    end        
  end
end
