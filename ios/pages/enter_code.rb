module Pages
  class EnterCode
    def initialize
    end

    def enter_code(code)
      find_element(:accessibility_id, "user_session[password]").type(code)
      hide_keyboard
    end          
  end
end