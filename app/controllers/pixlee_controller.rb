require 'digest/sha1'

class PixleeController < ApplicationController
  def start
  end

  def index
  	$user_id = params[:uid]
  end

  def createAuth
  	$auth_token = ($user_id + params[:timeStamp] + params[:url] + "pixlee")
  	p $auth_token
  	$auth_token = Digest::SHA512($auth_token)
  end

  def getAuth
  	p $auth_token
  	respond_to do |format|
		format.json {render json: $auth_token}
 	end
  end
end
