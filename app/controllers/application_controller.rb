class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery  :shared_secret => 'pixlee' #with: :exception #:sharedSecret => "pixlee"
end
