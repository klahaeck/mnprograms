var totalWorkBlocks;
var currentBlock;
var validations = new Array();

$(document).ready(function() {
	
	totalWorkBlocks = $(".work_block").length;
	currentBlock = 1;
	
	$(".work_block").each(function() {
		$(this).find(".work_link").hide();
		$(this).find(".work_type select").val(1);
		$(this).find(".work_type select").change(changeHandler);
	});
	
	//  VALIDATIONS BEGIN  ///////////////////////////////////////////
	
	var submission_statement = new LiveValidation('submission_statement');
	submission_statement.add( Validate.Presence );
	
	var submission_resume = new LiveValidation('submission_resume');
	submission_resume.add( Validate.Presence );
	
	
	$(".work_block").each(function(index) {
		
		var workValidations = {};
		
		//var submission_works_attributes_title = new LiveValidation('submission_works_attributes_' + index + '_title');
		//submission_works_attributes_title.add( Validate.Presence );
		//Validate.now( Validate.Numericality, '2007', { is: 2007 } );
		//submission_works_attributes_title.disable();
		//workValidations.validationTitle = submission_works_attributes_title;
		
		var submission_works_attributes_link = new LiveValidation('submission_works_attributes_' + index + '_link');
		submission_works_attributes_link.add( Validate.Presence );
		submission_works_attributes_link.disable();
		workValidations.validationsLink = submission_works_attributes_link;
		
		var submission_works_attributes_image = new LiveValidation('submission_works_attributes_' + index + '_image');
		submission_works_attributes_image.add( Validate.Presence );
		submission_works_attributes_image.disable();
		workValidations.validationsImage = submission_works_attributes_image;
		
		validations[index] = workValidations;
		
		var titleField = $(this).find('.work_title input');
		var imageField = $(this).find('.work_image');
		var linkField = $(this).find('.work_link');
		
		titleField.keyup(function() {
			if (this.value != '') {
				if (imageField.is(':visible')) {
					submission_works_attributes_image.enable();
					submission_works_attributes_link.disable();
				} else {
					submission_works_attributes_image.disable();
					submission_works_attributes_link.enable();
				}
			} else {
				submission_works_attributes_image.disable();
				submission_works_attributes_link.disable();
			}
		});
		
	});
	
	//  VALIDATIONS END    ///////////////////////////////////////////
	
});

function changeHandler(event) {
	
	var selectedValue = $(this).val();
	var target = $(this).closest('.work_block');
	var titleField = target.find('.work_title input');
	
	var fullId = $(target).attr('id');
	var id = fullId.substr(-1);
	
	$(target).find('.work_image input').val("");
	$(target).find('.work_link input').val("");
	
	var type;
	
	switch (selectedValue) {
		case '1':
			type = "file";
			break;
		case '2':
			type = "link";
			break;
		case '3':
			type = "link";
			break;
		case '4':
			type = "file";
			break;
		default:
			type = "file";
	}
	
	if (type == "link") {
		$(target).find('.work_link').show();
		$(target).find('.work_image').hide();
		
		if (titleField.val() != '') {
			validations[id].validationsLink.enable();
		} else {
			validations[id].validationsLink.disable();
		}
		
		validations[id].validationsImage.disable();
	} else {
		$(target).find('.work_link').hide();
		$(target).find('.work_image').show();
		
		if (titleField.val() != '') {
			validations[id].validationsImage.enable();
		} else {
			validations[id].validationsImage.disable();
		}
		
		validations[id].validationsLink.disable();
	}
	
}