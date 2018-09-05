module Pages
    module NewClub
      class << self
          def click_cancel
            find_element(:accessibility_id, "Cancel").click
          end        
      end
    end
  end
  module Kernel
    def new_club
      Pages::NewClub
    end
  end