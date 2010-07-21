document.observe('dom:loaded', function() {

//  BEGIN SUBMISSION TYPE HIDE/SHOW   ///////////////////////////////////
	function processSelection(thisTarget, thisSelection) {
		//alert(thisTarget + thisSelection);
		
		if (thisSelection == 1) {
			$('image_' + thisTarget).show();
			$('url_' + thisTarget).hide();
			$('document_' + thisTarget).hide();
		} else if (thisSelection == 4) {
			$('image_' + thisTarget).hide();
			$('url_' + thisTarget).hide();
			$('document_' + thisTarget).show();
		} else {
			$('image_' + thisTarget).hide();
			$('url_' + thisTarget).show();
			$('document_' + thisTarget).hide();
		}
	}
	
	function clearValues(thisTarget) {
		$('submission_works_attributes_' + thisTarget + '_image').clear();
		$('submission_works_attributes_' + thisTarget + '_url').clear();
		$('submission_works_attributes_' + thisTarget + '_document').clear();
	}

	for (var i=0; i<4; i++) {
		(function(i) {
			$('submission_works_attributes_' + i + '_type_id').observe('change', function(event) {
				var index = this.selectedIndex;
				var option = this.options[index].value;
				//alert(option);
				clearValues(i);
				processSelection(i, option);
			});
			
			//alert($('submission_works_attributes_' + i + '_type_id').selectedIndex);
			
			processSelection(i, $('submission_works_attributes_' + i + '_type_id').options[$('submission_works_attributes_' + i + '_type_id').selectedIndex].value);
			
		})(i);
	}

//  END SUBMISSION TYPE HIDE/SHOW   /////////////////////////////////////


});