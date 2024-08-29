class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    private
  
    # Redirect authenticated users from the Devise sign-in page
    def after_sign_in_path_for(resource)
        posts_path # Assuming you have set up a home#index as the landing page after login
    end
  end
  