module Pages
  class Consent
    def initialize
    end

    def goto_clubs
      find_element(:accessibility_id, "Save").click
      $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Team App").displayed? }        
    end        
  end
end
  