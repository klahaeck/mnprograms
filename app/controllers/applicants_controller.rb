class ApplicantsController < ApplicationController

  before_filter :authenticate_admin!, :except => [:new, :create, :index, :show, :rate]
  before_filter :authenticate_juror!, :only => [:rate]
  helper_method :sort_column, :sort_direction
  
  def index
  	@program = Program.find(params[:program_id])
  	if admin_signed_in? || juror_signed_in?
	  	@user = juror_session
	  	@applicants = @program.applicants.all :order => "#{sort_column} #{sort_direction}"
	  	#@applicants = @program.applicants.all :order => 'created_at ASC'
	  	respond_to do |format|
			format.html
			format.xls { send_data @applicants.to_xls }
		end
  	else
  		flash[:notice] = "You do not have access to this area."
  		redirect_to @program
  	end
  end
  
  def show
  	if admin_signed_in? || juror_signed_in?
	  	@user = juror_session
	  	@applicant = Applicant.find(params[:id])
  	else
  		flash[:notice] = "You do not have access to this area."
  		redirect_to root_url
  	end
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
  	@program = @applicant.program
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
  
  def rate
  	@applicant = Applicant.find(params[:id])
	@applicant.rate(params[:stars], current_juror, params[:dimension])
	render :update do |page|
		page.replace_html @applicant.wrapper_dom_id(params), ratings_for(@applicant, params.merge(:wrap => false))
	    page.visual_effect :highlight, @applicant.wrapper_dom_id(params)
	end
  end
  
  def sort_column
  	Applicant.column_names.include?(params[:sort]) ? params[:sort] : 'created_at'
  end
  
  def sort_direction
  	%w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
