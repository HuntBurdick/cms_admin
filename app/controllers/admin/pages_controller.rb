module Admin
  
  class PagesController < AdminController


    def index
      @pages = Page.paginate(:page => params[:page], :per_page => 10).order('position ASC')
    end


    def show_posts
      @posts = Post.where(:page_id => params[:id]).paginate(:page => params[:page], :per_page => 20).order('position ASC')
      @page = Page.find(params[:id])
    end
    

    def new
      @page = Page.new
    end
    

    def edit
      @page = Page.find(params[:id])
    end
    

    def create
      @page = Page.new(page_params)
     
      if @page.save
        flash[:notice] = "Page was created."
        redirect_to :action => 'index'
      else
        render :action => 'new'
      end
    end

  
    def update
      @page = Page.find(params[:id])

      if @page.update(page_params)
        flash[:notice] = 'Page was successfully updated.'
        redirect_to :back
      else
        render action: 'edit'
      end
    end

    def publish
      page = Page.find(params[:page_id])
      page.published = ( page.published == true ? false : true)
      page.save

      respond_to do |format|
        # format.html 
        format.js { list_refresh }
      end
    end

    def destroy
      page = Page.find(params[:page_id])
      page.destroy

      respond_to do |format|
        # format.html 
        format.js { list_refresh }
      end
    end

    def move_up
      page = Page.find(params[:page_id])
      page.move_higher
      page.save

      respond_to do |format|
        # format.html 
        format.js { list_refresh }
      end
    end

    def move_down
      page = Page.find(params[:page_id])
      page.move_lower
      page.save

      respond_to do |format|
        # format.html 
        format.js { list_refresh }
      end
    end

    private

      def list_refresh
        @pages = Page.paginate(:page => params[:page], :per_page => 10).order('position ASC')
        return render(:file => 'admin/pages/list_refresh.js.erb')
      end

      def page_params
        params.require(:page).permit(:show_in_menu, :only_for_logged_in_members, :image, :name, :body, :published, :position, :created_on, :updated_on)
      end
    
  end

end
