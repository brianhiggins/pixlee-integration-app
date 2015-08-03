require 'digest/sha1'

class PixleeController < ApplicationController
  def start
  end

  def index
  	session[:user_id] = params[:uid]
  	p session[:user_id]
  end

  def createAuth
  	p session[:user_id]
  	$auth_token = (session[:user_id] + params[:timeStamp] + params[:url] + "pixlee")
  	p $auth_token
  	$auth_token = Digest::SHA512.digest($auth_token)
  end

  def getAuth
  	p $auth_token
  	respond_to do |format|
		format.json {render json: $auth_token}
 	end
  end
end
