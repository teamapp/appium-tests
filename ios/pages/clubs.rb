module Pages
    module Clubs
      class << self
          def click_create
            find_element(:accessibility_id, "Create a\nTeam App").click
            $wait.until { find_ele_by_attr("XCUIElementTypeNavigationBar", "name", "New Team App").displayed? }        
          end        
      end
    end
  end
  module Kernel
    def clubs
      Pages::Clubs
    end
  end