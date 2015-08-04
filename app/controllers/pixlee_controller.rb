require 'digest/sha1'

class PixleeController < ApplicationController
  def start
  end

  def index
  	session[:user_id] = params[:uid]
  end

  def getAuth
    p session[:user_id]
  	auth_token = session[:user_id] + params[:timeStamp] + params[:url] + "pixlee"
  	auth_token = Digest::SHA1.hexdigest(auth_token)

  	respond_to do |format|
  		format.json {render json: auth_token}
   	end
  end
end
