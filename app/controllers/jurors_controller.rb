class JurorsController < ApplicationController
  
  before_filter :authenticate_admin!, :except => [:edit, :update]
  
  def index
    @jurors = Juror.all
  end
  
  def show
    @juror = Juror.find(params[:id])
  end
  
  def new
    @juror = Juror.new
  end
  
  def create
    @juror = Juror.new(params[:juror])
    if @juror.save
      flash[:notice] = "Successfully created juror."
      redirect_to jurors_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @juror = Juror.find(params[:id])
  end
  
  def update
    @juror = Juror.find(params[:id])
    if @juror.update_attributes(params[:juror])
      flash[:notice] = "Successfully updated juror."
      redirect_to jurors_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @juror = Juror.find(params[:id])
    @juror.destroy
    flash[:notice] = "Successfully destroyed juror."
    redirect_to jurors_url
  end
  
end