class HtmlPagesController < ApplicationController
    def home
        redirect_to home_url(current_user) if logged_in?
    end
  
    def help
    end
  
    def about
    end
  
    def contact
    end
end
