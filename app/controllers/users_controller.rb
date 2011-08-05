class UsersController < ApplicationController
  
  load_and_authorize_resource :except => [:index]
  
  def index
    @users = User.page(params[:page])
    authorize! :read, @users
  end
  
  def show
    @profile = @user.profile
  end
  
  def new
    @user.role_ids = [4]
    @user.build_profile
  end
  
  def create
    if @user.save
      flash[:notice] = "Successfully created user."
      redirect_to users_url
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Successfully updated user."
      redirect_to users_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user.destroy
    flash[:notice] = "Successfully destroyed user."
    redirect_to users_url
  end
  
end