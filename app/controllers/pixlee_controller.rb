class PixleeController < ApplicationController
  def start
  end

  def index
  	if $user_id == nil
	  	$user_id = params[:uid]

  	end
  end

  def createAuth
  	$auth_token = ($user_id + params[:timeStamp] + params[:url] + "pixlee")
  	$auth_token = Digest::SHA2.new(512).digest($auth_token)
  	p $auth_token

  end

  def getAuth
  	respond_to do |format|
		format.json {render json: $auth_token}
 	end
  end
end
