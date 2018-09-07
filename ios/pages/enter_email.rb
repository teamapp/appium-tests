module Pages
  class EnterEmail
      def initialize
      end

      def enter_email(email)
        find_element(:accessibility_id, "user_session[email]").type(email)
      end    
      
      def goto_enter_password
        find_element(:accessibility_id, "Continue").click
        $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Log In").displayed? }
        Pages::EnterPassword.new
      end 
      
      def goto_enter_code
        find_element(:accessibility_id, "Continue").click
        $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Log In").displayed? }
        Pages::EnterCode.new
      end 

      def goto_new_user
        find_element(:accessibility_id, "Continue").click
        $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Log In").displayed? }
        Pages::NewUser.new
      end 
    end      
  end
