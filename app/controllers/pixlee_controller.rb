class PixleeController < ApplicationController
  #root
  def start
  end

  #essentially the dashboard that allows the clicking of buttons
  def index
  	session[:user_id] = params[:uid]
    session[:ts] = params[:ts]
  end

  # creates the token for attaching a file and returns it to an ajax get request
  def getAuth
    p session[:user_id]
    p session[:ts]
  	auth_token = session[:user_id] + session[:ts] + params[:url] + "pixlee"
  	auth_token = Digest::SHA512.hexdigest(auth_token)


    value = []
    value << auth_token
    value << session[:ts]
    p value

  	respond_to do |format|
  		format.json {render json: value}
   	end
  end
end
