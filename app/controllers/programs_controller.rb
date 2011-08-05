class ProgramsController < ApplicationController
  #include ProgramsHelper
  
  load_and_authorize_resource :except => [:index]
  
  def index
    @programs = Program.page(params[:page])
    # authorize! :read, @programs
  end

  def show
=begin    if params[:url]
      @program = Program.find_by_url(params[:url])
    else
      @program = Program.find(params[:id])
    end
    authorize! :read, @program
    if @program
      render :layout => 'program'
    else
      # redirect_to root_url, :flash => "We cannot find the site you are looking for"
      render_404
    end
=end
    render :layout => 'program'
  end

  def new
  end

  def create
    if @program.save
      redirect_to @program, :notice => "Successfully created program."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if not params[:program][:juror_ids]
      @program.juror_ids = ""
    end
    if not params[:program][:editor_ids]
      @program.editor_ids = ""
    end
    if @program.update_attributes(params[:program])
      redirect_to @program, :notice  => "Successfully updated program."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @program.destroy
    redirect_to programs_url, :notice => "Successfully destroyed program."
  end
  
  def set_default
    defaults = Program.default
    for default in defaults do
      default.update_attribute :default, false
    end
    
    @program = Program.find(params[:id])
    @program.update_attribute :default, true
    redirect_to programs_url, :notice => "Successfully set default program."
  end
  
  def guidelines
=begin    if params[:url]
      @program = Program.find_by_url(params[:url])
    else
      @program = Program.find(params[:id])
    end
    authorize! :guidelines, @program
    if @program
      render :layout => 'program'
    else
      # redirect_to root_url, :flash => "We cannot find the site you are looking for"
      render_404
    end
=end
    render :layout => 'program'
  end
  
  def description
=begin    if params[:url]
      @program = Program.find_by_url(params[:url])
    else
      @program = Program.find(params[:id])
    end
    authorize! :description, @program
    if @program
      render :layout => 'program'
    else
      # redirect_to root_url, :flash => "We cannot find the site you are looking for"
      render_404
   end
=end
    render :layout => 'program'
  end
  
  def thankyou
=begin    if params[:url]
      @program = Program.find_by_url(params[:url])
    else
      @program = Program.find(params[:id])
    end
    authorize! :thankyou, @program
    if @program
      render :layout => 'program'
    else
      # redirect_to root_url, :flash => "We cannot find the site you are looking for"
      render_404
    end
=end
    render :layout => 'program'
  end
  
end
