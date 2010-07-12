class ProgramsController < ApplicationController

  before_filter :authenticate_user!, :except => [:named, :guidelines, :index, :show]
 
  def index
    @programs = Program.all
  end
  
  def show
    @program = Program.find(params[:id])
    
    respond_to do |format|
       format.html
    end
  end
  
  def new
    @program = Program.new
  end
  
  def create
    @program = Program.new(params[:program])
    if @program.save
      flash[:notice] = "Successfully created program."
      redirect_to @program
    else
      render :action => 'new'
    end
  end
  
  def edit
    @program = Program.find(params[:id])
  end
  
  def update
    @program = Program.find(params[:id])
    if @program.update_attributes(params[:program])
      flash[:notice] = "Successfully updated program."
      redirect_to @program
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    flash[:notice] = "Successfully destroyed program."
    redirect_to programs_url
  end
  
  def guidelines
  	@program = Program.find(params[:id])
  	
    respond_to do |format|
       format.html
    end
  end
  
end
