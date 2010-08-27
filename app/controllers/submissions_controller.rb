class SubmissionsController < ApplicationController

  before_filter :authenticate_admin!, :only => [:edit, :update, :destroy]
  
  def index
  	@applicant = Applicant.find(params[:applicant_id])
    @submissions = @applicant.build_submission
  end
  
  def show
  	@submission = Submission.find(params[:id])
    @applicant = Applicant.find(@submission.applicant_id)
  end
  
  def new
  	@applicant = Applicant.find(params[:applicant_id])
  	@program = Program.find(@applicant.program_id)
    @submission = @applicant.build_submission
    4.times do
    	work = @submission.works.build
    end
  end
  
  def create
  	@applicant = Applicant.find(params[:applicant_id])
  	@program = Program.find(@applicant.program_id)
    @submission = @applicant.build_submission(params[:submission])
   
  	if @submission.save
      flash[:notice] = "You have successfully submitted your content!"
      redirect_to program_url(@program) + '/thankyou'
    else
      render :action => 'new'
    end
  end
  
  def edit
    @submission = Submission.find(params[:id])
    @applicant = @submission.applicant
  	@program = Program.find(@applicant.program_id)
  	
  	totalsubs = @submission.works.count
  	totalleft = 4 - totalsubs
  	
  	totalleft.times do
    	work = @submission.works.build
    end
  end
  
  def update  	
    @submission = Submission.find(params[:id])
    @applicant = @submission.applicant
    @program = Program.find(@applicant.program_id)
    if @submission.update_attributes(params[:submission])
      flash[:notice] = "Successfully updated submission."
      redirect_to @applicant
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
