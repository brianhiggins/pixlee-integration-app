class PixleeController < ApplicationController
  #root
  def start
  end

  #essentially the dashboard that allows the clicking of buttons
  def index
  	session[:data] = [params[:uid], params[:ts]]
    p session[:data]
    $test = session[:data]
  end

  # creates the token for attaching a file and returns it to an ajax get request
  def getAuth
    p $test
  	auth_token = $test[0] + $test[1] + params[:url] + "pixlee"
  	auth_token = Digest::SHA512.digest(auth_token)

    value = [auth_token, $test[1]]
    p value

  	respond_to do |format|
  		format.json {render json: value}
   	end
  end
end
