class ApplicantsController < ApplicationController

  #before_filter :authenticate_admin!, :except => [:new, :create]
  
  def index
    @applicants = Applicant.all
  end
  
  def show
    @applicant = Applicant.find(params[:id])
  end
  
  def new
  	@applicant = Applicant.new
  	@program = Program.find(params[:program_id])
  end
  
  def create
  	@applicant = Applicant.new(params[:applicant])
  	@program = Program.find(@applicant.program_id)
    if @applicant.save
    	#flash[:notice] = "Successfully created applicant"
    	redirect_to new_submission_path(:applicant_id => @applicant)
    else
    	render :action => 'new'
    end
  end
  
  def edit
    @applicant = Applicant.find(params[:id])
  	@program = Program.find(@applicant.program_id)
  end
  
  def update
    @applicant = Program.find(params[:id])
    if @applicant.update_attributes(params[:applicant])
      flash[:notice] = "Successfully updated applicant."
      redirect_to @applicant
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @applicant = Applicant.find(params[:id])
    @applicant.destroy
    flash[:notice] = "Successfully destroyed applicant."
    redirect_to applicants_url
  end
end
