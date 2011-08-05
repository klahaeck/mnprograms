class TypesController < ApplicationController
  
  load_and_authorize_resource
  
  def index
  end

  def new
  end

  def create
    if @type.save
      redirect_to types_url, :notice => "Successfully created type."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @type.update_attributes(params[:type])
      redirect_to types_url, :notice  => "Successfully updated type."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @type.destroy
    redirect_to types_url, :notice => "Successfully destroyed type."
  end
end
