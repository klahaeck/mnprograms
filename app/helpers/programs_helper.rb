module ProgramsHelper
  
  def named_program_path(program)
    "/" + program.cached_slug
  end
  
  def named_program_url(program)
    root_url + program.cached_slug
  end
  
end
