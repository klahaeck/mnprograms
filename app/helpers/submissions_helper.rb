module SubmissionsHelper

  def current_submission(program)
    if user_signed_in?
      submission = current_user.submissions.find_by_program_id(program.id)
    end
  end

end