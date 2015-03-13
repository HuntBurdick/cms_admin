module Admin
  
  class PublicUsersController < ApplicationController
    before_filter :authenticate_user!

    layout 'admin'

    before_action :set_parent_item, only: [:show, :edit, :update]

    # GET /parent_items
    # GET /parent_items.json
    def index
      @parent_items = PublicUser.paginate(:page => params[:page], :per_page => 20)
    end

    # GET /parent_items/new
    def new
      @parent_item = PublicUser.new
    end

    # GET /parent_items/1/edit
    def edit
    end

    # POST /parent_items
    # POST /parent_items.json
    def create
      @parent_item = PublicUser.new(:email => params[:public_user][:email], :password => params[:public_user][:password], :password_confirmation => params[:public_user][:password_confirmation])

      if @parent_item.save
        flash[:notice] = "PublicUser successfully created."
        redirect_to :controller => 'admin/public_users'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /parent_items/1
    # PATCH/PUT /parent_items/1.json
    def update

      if parent_item_params[:password].blank?
        parent_item_params.delete("password")
        parent_item_params.delete("password_confirmation")
      end


      if @parent_item.update(parent_item_params)
        flash[:notice] = "PublicUser successfully updated."
        redirect_to :action => 'edit'
      else
        render action: 'edit'
      end
    end

    # DELETE /parent_items/1
    # DELETE /parent_items/1.json
    def destroy
      @parent_item = PublicUser.find(params[:parent_item_id])

      @parent_item.destroy

      respond_to do |format|
        format.js { list_refresh }
      end
    end

    private

      def list_refresh
        @parent_items = PublicUser.paginate(:page => params[:page], :per_page => 20)
        return render(:file => 'admin/public_users/list_refresh.js.erb')
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_parent_item
        @parent_item = PublicUser.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def parent_item_params
        params.require(:public_user).permit(:is_admin, :email, :password, :password_confirmation, :remember_me)
      end
  end


end