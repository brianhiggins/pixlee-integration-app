class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception, :except => :pixlee
  
  protect_from_forgery :shared_secret => "pixlee", :except => :pixlee
 
end
