class SessionsController < ApplicationController
  def new
  	session[:uid] = params[:uid]
  	p session[:uid]
  	redirect_to '/index'
  end
end
