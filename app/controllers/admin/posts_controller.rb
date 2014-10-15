module Admin
  
  class PostsController < AdminController
    
    def index
      @pages = Page.paginate(:page => params[:page], :per_page => 10).order('name ASC')
    end
    

    def new
      @pages = Page.all
      @post = Post.new
      @page = Page.find(params[:page_id])
    end
    

    def edit
      @post = Post.find(params[:id])
      @page = Page.find(params[:page_id])
    end
    

    def create
      @post = Post.new(post_params)
      @page = Page.find(params[:post][:page_id])
     
      if @post.save
        flash[:success] = "Post was created."
        redirect_to :action => 'index'
      else
        render :action => 'new'
      end
    end

  
    def update
      @post = Post.find(params[:id])
      @page = @post.page

      if @post.update(post_params)
        flash[:notice] = 'Post was successfully updated.'
        redirect_to :back
      else
        render action: 'edit'
      end
    end

    def publish
      post = Post.find(params[:post_id])
      post.published = ( post.published == true ? false : true)
      post.save

      respond_to do |format|
        # format.html 
        format.js { list_refresh }
      end
    end

    def destroy
      post = Post.find(params[:post_id])
      post.destroy

      respond_to do |format|
        # format.html 
        format.js { list_refresh }
      end
    end

    def move_up
      post = Post.find(params[:post_id])
      post.move_higher
      post.save

      respond_to do |format|
        # format.html 
        format.js { list_refresh }
      end
    end

    def move_down
      post = Post.find(params[:post_id])
      post.move_lower
      post.save

      respond_to do |format|
        # format.html 
        format.js { list_refresh }
      end
    end

    private

      def list_refresh
        if params[:show_posts] == 'true'
          @posts = Post.where(:page_id => params[:id]).paginate(:page => params[:page], :per_page => 20).order('position ASC')
          return render(:file => 'admin/posts/show_list_refresh.js.erb')
        else
          @pages = Page.paginate(:page => params[:page], :per_page => 10).order('name ASC')
          return render(:file => 'admin/posts/list_refresh.js.erb')
        end
      end

      def post_params
        params.require(:post).permit( :price, :quantity, :title, :body, :page_id, :published, :meta_description, :image, :created_on, :updated_on)
      end

  end

end
