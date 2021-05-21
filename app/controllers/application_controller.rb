class ApplicationController < ActionController::Base
    def hello
        render html: "Oh hai Mark!"
    end
end
