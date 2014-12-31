module Admin

	class AdminController < ApplicationController
		before_filter :authenticate_user!
		before_filter :check_if_admin
		
  	layout 'admin'

  	def index
  	end

  	def dashboard
  	end

  	private

  		def check_if_admin
				if user_signed_in?
					flash[:alert] = "You are not an admin."
					redirect_to '/'
				end
  		end

  end

end