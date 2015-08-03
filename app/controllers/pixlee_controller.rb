require 'digest/sha1'

class PixleeController < ApplicationController
  def start
  	session[:uid] = nil
  end

  def index
  	session[:uid] = params[:uid]
  	p session[:uid]
  end

  def createAuth
  	p session[:uid]
  	$auth_token = (session[:uid] + params[:timeStamp] + params[:url] + "pixlee")
  	p $auth_token
  	$auth_token = Digest::SHA1.hexdigest($auth_token)
  	p $auth_token

  end

  def getAuth
  	p $auth_token
  	respond_to do |format|
		format.json {render json: $auth_token}
 	end
  end
end
