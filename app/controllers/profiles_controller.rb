class ProfilesController < ApplicationController
  
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def new
  end

  def create
    if @profile.save
      redirect_to @profile, :notice => "Successfully created profile."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @profile.update_attributes(params[:profile])
      redirect_to @profile, :notice  => "Successfully updated profile."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_url, :notice => "Successfully destroyed profile."
  end
end
