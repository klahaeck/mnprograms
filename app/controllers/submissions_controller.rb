class SubmissionsController < ApplicationController
  
  def index
    @submissions = Submission.all
  end
  
  def show
    @submission = Submission.find(params[:id])
  end
  
  def new
  	@applicant = Applicant.find(params[:applicant_id])
  	@program = Program.find(@applicant.program_id)
    @submission = Submission.new
    4.times do
    	work = @submission.works.build
    end
  end
  
  def create
    @submission = Submission.new(params[:submission])
    @applicant = Applicant.find(@submission.applicant_id)
  	@program = Program.find(@applicant.program_id)
    if @submission.save
      flash[:notice] = "You have successfully submitted your content!"
      redirect_to @program
    else
      render :action => 'new'
    end
  end
  
  def edit
    @submission = Submission.find(params[:id])
  end
  
  def update
    @submission = Submission.find(params[:id])
    if @submission.update_attributes(params[:submission])
      flash[:notice] = "Successfully updated submission."
      redirect_to @submission
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    flash[:notice] = "Successfully destroyed submission."
    redirect_to submissions_url
  end
end
