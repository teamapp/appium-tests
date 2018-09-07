module Pages
  class Consent
    def initialize
    end

    def accept_terms
      find_element(:accessibility_id, "user[terms_of_service]").click
      find_element(:accessibility_id, "user[privacy_policy]").click
      find_element(:accessibility_id, "user[fair_processing_notice]").click
      find_element(:accessibility_id, "user[over_age_16]").click
    end

    def goto_clubs      
      find_element(:accessibility_id, "Save").click
      $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "Team App").displayed? }        
    end        
  end
end
  