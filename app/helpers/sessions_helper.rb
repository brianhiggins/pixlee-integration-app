module SessionsHelper
	def getID
		return session[:uid]
	end
end
