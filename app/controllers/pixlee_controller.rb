class PixleeController < ApplicationController
  def start
  end

  def index
  	@auth_token = "butts"
  	if @user_id == nil
	  	@user_id = params[:uid]
  	end
  end

  def createAuth
  	@auth_token = "big butts" #(@user_id + params[:data][:timeStamp] + params[:data][:url] + "SHARED_SECRET")
  	@auth_token = Digest::SHA2.new(512).hexdigest(@auth_token)
  end

  def getAuth
  	return @auth_token
  end
end
