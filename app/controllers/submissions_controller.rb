class SubmissionsController < ApplicationController

	load_and_authorize_resource :program
	load_and_authorize_resource :submission, :through => :program, :except => [:index]
	
  def index
    @submissions = @program.submissions.page(params[:page])
    authorize! :read, @submissions
    render :layout => 'program'
  end

  def show
    render :layout => 'program'
  end

  def new
    if current_user.submission(@program)
      redirect_to @program, :notice  => "You have already submitted your work for this program"
  	else
  	  maxwork = @program.max_work
    	maxwork.times do
    		work = @submission.works.build
    	end
    	render :layout => 'program'
	  end
  end

  def create
    @submission.user_id = current_user.id
    if @submission.save
      redirect_to program_path(@program) + '/thankyou', :notice => "Successfully created submission."
    else
      render :action => 'new'
    end
  end

  def edit
    maxwork = @program.max_work
  	maxwork.times do
  		work = @submission.works.build
  	end
    render :layout => 'program'
  end

  def update
    if @submission.update_attributes(params[:submission])
      redirect_to program_submission_path(@program, @submission), :notice  => "Successfully updated submission."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @submission.destroy
    if can? :read, @program.submissions
      redirect_to program_submissions_path(@program), :notice => "Successfully destroyed submission."
    else
      redirect_to @program
    end
  end
  
  def rate
    @submission.rate(params[:stars], current_user, params[:dimension])
  end

end
