class PixleeController < ApplicationController
  #root
  def start
  end

  #essentially the dashboard that allows the clicking of buttons
  def index
  	session[:user_id] = params[:uid]
    session[:timeStamp] = params[:timeStamp]
  end

  # creates the token for attaching a file and returns it to an ajax get request
  def getAuth
    p session[:user_id]
  	auth_token = session[:user_id] + session[:timeStamp] + params[:url] + "pixlee"
  	auth_token = Digest::SHA512.digest(auth_token)

    value = [auth_token, timeStamp]

  	respond_to do |format|
  		format.json {render json: value}
   	end
  end
end
