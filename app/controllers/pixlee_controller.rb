class PixleeController < ApplicationController
  def start
  end

  def index
  	if $user_id == nil
	  	$user_id = params[:uid]
  	end
  end

  def createAuth
  	p $user_id
  	@auth_token = ($user_id + params[:timeStamp] + params[:url] + "pixlee")
  	p @auth_token
  	@auth_token = Digest::SHA2.new(512).hexdigest(@auth_token)
  	p @auth_token

  end

  def getAuth
  	# respond_to |format|
		# format.html
		# format.json {render json: @auth_token}
 	# end
  end
end
