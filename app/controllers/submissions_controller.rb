class SubmissionsController < ApplicationController

  before_filter :authenticate_user!, :except => [:new, :create]
  
  def index
  	@applicant = Applicant.find(params[:applicant_id])
    @submissions = @applicant.submissions.all
  end
  
  def show
  	@submission = Submission.find(params[:id])
    @applicant = Applicant.find(@submission.applicant_id)
  end
  
  def new
  	@applicant = Applicant.find(params[:applicant_id])
  	@program = Program.find(@applicant.program_id)
    @submission = @applicant.submissions.build
    4.times do
    	work = @submission.works.build
    end
  end
  
  def create
  	@applicant = Applicant.find(params[:applicant_id])
  	@program = Program.find(@applicant.program_id)
    @submission = @applicant.submissions.build(params[:submission])
   
  	if @submission.save
      flash[:notice] = "You have successfully submitted your content!"
      redirect_to @program
    else
      render :action => 'new'
    end
  end
  
  def edit
  	@applicant = Applicant.find(params[:applicant_id])
  	@program = Program.find(@applicant.program_id)
    @submission = Submission.find(params[:id])
  end
  
  def update
  	@applicant = Applicant.find(params[:applicant_id])
  	@program = Program.find(@applicant.program_id)
    @submission = Submission.find(params[:id])
    if @submission.update_attributes(params[:submission])
      flash[:notice] = "Successfully updated submission."
      redirect_to @submission
    else
      render :action => 'edit'
    end
  end
  
  def destroy
  	@applicant = Applicant.find(params[:applicant_id])
  	@program = Program.find(@applicant.program_id)
    @submission = Submission.find(params[:id])
    @submission.destroy
    flash[:notice] = "Successfully destroyed submission."
    redirect_to @applicant
  end
end
