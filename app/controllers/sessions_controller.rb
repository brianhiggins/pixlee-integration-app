class SessionsController < ApplicationController
  def new
  	p params[:uid]
  	session[:uid] = params[:uid]
  	p session[:uid]
  	redirect_to '/index'
  end
end
