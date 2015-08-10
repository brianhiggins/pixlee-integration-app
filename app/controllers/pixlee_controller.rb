require 'digest/sha512'

class PixleeController < ApplicationController
  #root
  def start
  end

  #essentially the dashboard that allows the clicking of buttons
  def index
  	session[:user_id] = params[:uid]
  end

  # creates the token for attaching a file and returns it to an ajax get request
  def getAuth
    p session[:user_id]
  	auth_token = session[:user_id] + params[:timeStamp] + params[:url] + "pixlee"
  	auth_token = Digest::SHA512.hexdigest(auth_token)
    p auth_token

  	respond_to do |format|
  		format.json {render json: auth_token}
   	end
  end
end
