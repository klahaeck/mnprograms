class ProgramsController < ApplicationController

  before_filter :authenticate_admin!, :except => [:named, :guidelines, :index, :show]
 
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
  
  def named
    @program = Program.find_by_url(params[:url])
    if @program
     #render :action => 'show'
    else
     redirect_to '/404.html'
    end
  end
  
  def guidelines
    @program = Program.find_by_url(params[:url])
    if @program
     #render :action => 'show'
    else
     redirect_to '/404.html'
    end
  end
  
end
