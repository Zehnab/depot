class ApplicationController < ActionController::Base
  protect_from_forgery
  
     before_filter :index_page
  
     def set_current_user
      User.current = current_user
    end
    
     def set_current_lesson
      Lesson.current = current_lesson
    end
    
    private 
    def index_page
      @pages=Page.find :all
    end

end
