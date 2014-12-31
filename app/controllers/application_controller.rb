class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :menu_pages

  layout :layout_by_resource

  def menu_pages
  	if user_signed_in?
			@pages = Page.where(:show_in_menu => true, :published => true).order('position ASC')
		else 
			@pages = Page.where(:only_for_logged_in_members => false, :show_in_menu => true, :published => true).order('position ASC')
		end
	end

  # Direct login and logout actions for admin users.
  def after_sign_in_path_for(user)
    flash[:notice] = "Welcome."
	  '/admin'
	end

	def after_sign_out_path_for(user)
    flash[:notice] = "Signed out."
		'/admin'
	end


  # Direct login and logout actions for public users.
  def after_sign_in_path_for(public_user)
    flash[:notice] = "Welcome."
    '/'
  end

  def after_sign_out_path_for(public_user)
    flash[:notice] = "Signed out."
    '/'
  end

	def label_for_string(string)
		string.gsub("admin/", "").gsub("_", " ").titleize
	end

	protected

    def layout_by_resource
      if devise_controller? && resource_name == :user
        "admin"
      else
        "application"
      end
    end

end