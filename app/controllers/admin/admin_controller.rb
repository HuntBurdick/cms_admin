module Admin

	class AdminController < ApplicationController
		before_filter :authenticate_user!
		
  	layout 'admin'

  	def index
  	end

  	def dashboard
  	end

  end

end