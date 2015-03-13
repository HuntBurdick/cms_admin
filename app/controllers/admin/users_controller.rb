module Admin
  
  class UsersController < ApplicationController
  	before_filter :authenticate_user!

  	layout 'admin'

	  before_action :set_user, only: [:show, :edit, :update]

	  # GET /users
	  # GET /users.json
	  def index
	    @users = User.paginate(:page => params[:page], :per_page => 20)
	  end

	  # GET /users/new
	  def new
	    @user = User.new
	  end

	  # GET /users/1/edit
	  def edit
	  end

	  # POST /users
	  # POST /users.json
	  def create
	    @user = User.new(:email => params[:user][:email], :password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])

      if @user.save
      	flash[:notice] = "User successfully created."
        redirect_to :controller => 'admin/users'
      else
        render action: 'new'
      end
	  end

	  # PATCH/PUT /users/1
	  # PATCH/PUT /users/1.json
	  def update

	    if user_params[:password].blank?
	      user_params.delete("password")
	      user_params.delete("password_confirmation")
	    end


	    if @user.update(user_params)
	    	flash[:notice] = "User successfully updated."
	      redirect_to :action => 'edit'
	    else
	      render action: 'edit'
	    end
	  end

	  # DELETE /users/1
	  # DELETE /users/1.json
	  def destroy
	  	@user = User.find(params[:user_id])

	    unless @user.id == 1
	      @user.destroy
	    end

	    respond_to do |format|
        format.js { list_refresh }
      end
	  end

	  private

	  	def list_refresh
        @users = User.paginate(:page => params[:page], :per_page => 20)
        return render(:file => 'admin/users/list_refresh.js.erb')
      end

	    # Use callbacks to share common setup or constraints between actions.
	    def set_user
	      @user = User.find(params[:id])
	    end

	    # Never trust parameters from the scary internet, only allow the white list through.
	    def user_params
	      params.require(:user).permit(:is_admin, :email, :password, :password_confirmation, :remember_me)
	    end
	end


end