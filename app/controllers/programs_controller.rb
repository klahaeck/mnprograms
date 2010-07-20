class ProgramsController < ApplicationController

  before_filter :authenticate_user!, :except => [:thankyou, :guidelines, :index, :show]
 
  def index
    @programs = Program.all
    @users = User.all
  end
  
  def show
    @program = Program.find(params[:id])
    
    if @program.published == true || user_signed_in?
	    respond_to do |format|
	       format.html
	    end
    else
    	flash[:notice] = "The program you've selected cannot be found."
    	redirect_to programs_url
    end
  end
  
  def new
  	@jurors = User.find_by_role('admin')
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
  	@jurors = User.find_by_role('admin')
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
  	
  	if @program.published == true || user_signed_in?
	    respond_to do |format|
	       format.html
	    end
	else
		flash[:notice] = "The program you've selected cannot be found."
    	redirect_to programs_url
    end
  end
  
  def thankyou
  	@program = Program.find(params[:id])
  	
  	if @program.published == true || user_signed_in?
	    respond_to do |format|
	       format.html
	    end
	else
		flash[:notice] = "The program you've selected cannot be found."
    	redirect_to programs_url
    end
  end
  
end
