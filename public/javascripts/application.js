$(document).ready(function() {
  
	$("#close_link").click(function() {
		$(this).parent().fadeTo("fast", 0.00, function(){ //fade
             $(this).slideUp("fast", function() { //slide up
                 $(this).remove(); //then remove from the DOM
             });
         });		
	});
	
	$('#admin_toolbar ul li a').button();
	
	$('#edit_services').button();
	
	$('.edit_file, .cancel_edit').button();
	
	$('#new_work_button, #edit_work_button, #view_submissions_link').button();
	
	$('#program_submit, #submission_submit, #user_submit, #profile_submit, .cancel, .delete_button').button();
	
	$('.existing_field .edit_file').click(function() {
		$(this).parent().next().css('display', 'inline');
		$(this).parent().hide();
		$('.work_type select').change();
		return false;
	});
	
	$('.new_field .cancel_edit').click(function() {
		$(this).parent().prev().css('display', 'inline');
		$(this).parent().hide();
		return false;
	});
  
});