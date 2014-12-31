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


  def after_sign_in_path_for(resource)
    if resource.class == PublicUser
      flash[:notice] = "Welcome."
      '/'
    elsif resource.class == User
      flash[:notice] = "Welcome."
      '/admin'
    else
      flash[:notice] = "Who are you!?"
      '/'
    end
  end

  def after_sign_out_path_for(resource)
    flash[:notice] = "Signed Out."
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