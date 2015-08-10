class PixleeController < ApplicationController
  #root
  def start
  end

  #essentially the dashboard that allows the clicking of buttons
  def index
  	session[:data] = [params[:uid], params[:ts]]
  end

  # creates the token for attaching a file and returns it to an ajax get request
  def getAuth
    p session[:data][1]
  	auth_token = session[:data][0] + session[:data][1] + params[:url] + "pixlee"
  	auth_token = Digest::SHA512.digest(auth_token)

    value = [auth_token, session[:data][1]]
    p value

  	respond_to do |format|
  		format.json {render json: value}
   	end
  end
end
