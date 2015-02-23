class PagesController < ApplicationController

  def index
    @page = Page.friendly.where(:position => 1)
  end

  def show
    set_page

    authorize_page(@page)

    @page_title       = label_for_string(@page.name)
    @page_description = @page.body.blank? ? '' : @page.body.truncate(60)

   
    @posts = Post.where(:page_id => @page.id, :published => true).order("position ASC")
    send(@page.slug.tr('-', '_')) rescue nil
    
  end

  private
    def set_page
      @page = Page.friendly.find(params[:id])
    end

    def home
      set_page
      # Resources for page modules can be set here.
    end

    def authorize_page(page)
      if page.only_for_logged_in_members == true && !public_user_signed_in?
        flash[:alert] = "You must be logged in to view this page."
        redirect_to '/'
      end
    end

end