class WorksController < ApplicationController
  
  load_resource :submission
  load_resource :work, :through => :submission, :shallow => true
  
  def index
  end

  def show
    render :layout => 'program'
  end

  def new
    render :layout => 'program'
  end

  def create
    if @work.save
      redirect_to @work, :notice => "Successfully created work."
    else
      render :action => 'new'
    end
  end

  def edit
    render :layout => 'program'
  end

  def update
    if @work.update_attributes(params[:work])
      redirect_to @work, :notice  => "Successfully updated work."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @work.destroy
    redirect_to works_url, :notice => "Successfully destroyed work."
  end
  
end
