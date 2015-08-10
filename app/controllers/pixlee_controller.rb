class PixleeController < ApplicationController
  #root
  def start
  end

  #essentially the dashboard that allows the clicking of buttons
  def index
    p params
  	session[:user_id] = params[:uid]
    session[:timeStamp] = params[:ts]
  end

  # creates the token for attaching a file and returns it to an ajax get request
  def getAuth
    p session[:timeStamp]
  	auth_token = session[:user_id] + session[:timeStamp] + params[:url] + "pixlee"
  	auth_token = Digest::SHA512.digest(auth_token)

    value = [auth_token, session[:timeStamp]]
    p value

  	respond_to do |format|
  		format.json {render json: value}
   	end
  end
end
