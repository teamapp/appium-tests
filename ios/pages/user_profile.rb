module Pages
    class UserProfile
      def initialize
      end
  
      def enter_name(name)
        find_element(:accessibility_id, "user[name]").type(name)
      end   
      
      def select_country
        find_element(:accessibility_id, "user[country]").click
        picker_wheel = find_element(:class, "XCUIElementTypePickerWheel")
        select_picker_wheel(element: picker_wheel, order: "next", offset: 0.1)
      end   

      def select_year_of_birth
        find_element(:accessibility_id, "user[year_of_birth]").click
        picker_wheel = find_element(:class, "XCUIElementTypePickerWheel")
        select_picker_wheel(element: picker_wheel, order: "next", offset: 0.5)
        select_picker_wheel(element: picker_wheel, order: "next", offset: 0.5)
        select_picker_wheel(element: picker_wheel, order: "next", offset: 0.5)
        select_picker_wheel(element: picker_wheel, order: "next", offset: 0.5)
        select_picker_wheel(element: picker_wheel, order: "next", offset: 0.5)
      end   

      def goto_consent
        find_element(:accessibility_id, "Save").click
        $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Consent").displayed? }        
        Pages::Consent.new
      end 
    end
  end