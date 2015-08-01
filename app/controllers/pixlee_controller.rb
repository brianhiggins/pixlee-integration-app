class PixleeController < ApplicationController
  def start
  end

  def index
  	if @user_id == nil
	  	@user_id = params[:uid]
  	end
  end

  def createAuth
  end

  def getAuth
  end
end
