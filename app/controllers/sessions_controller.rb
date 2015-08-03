class SessionsController < ApplicationController
  def new
  	session[:uid] = params[:uid]
  	redirect_to '/index'
  end
end
