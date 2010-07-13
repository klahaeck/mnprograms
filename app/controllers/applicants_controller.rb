class ApplicantsController < ApplicationController

  before_filter :authenticate_user!, :except => [:new, :create]
  
  def index
  	@program = Program.find(params[:program_id])
  	@applicants = @program.applicants
  end
  
  def show
  	@applicant = Applicant.find(params[:id])
  end
  
  def new
  	@program = Program.find(params[:program_id])
 	@applicant = @program.applicants.build  	
  end
  
  def create
  	@program = Program.find(params[:program_id])
  	@applicant = @program.applicants.build(params[:applicant])
    if @applicant.save
    	#flash[:notice] = "Successfully created applicant"
    	redirect_to new_applicant_submission_path(@applicant)
    else
    	render :action => 'new'
    end
  end
  
  def edit
  	@applicant = Applicant.find(params[:id])
  end
  
  def update
  	@applicant = Applicant.find(params[:id])
    if @applicant.update_attributes(params[:applicant])
      flash[:notice] = "Successfully updated applicant."
      redirect_to @applicant
    else
      render :action => 'edit'
    end
  end
  
  def destroy
  	@applicant = Applicant.find(params[:id])
  	@program = Program.find(@applicant.program_id)

    @applicant.destroy
    flash[:notice] = "Successfully destroyed applicant."
    redirect_to program_applicants_path(@program)
  end
end
