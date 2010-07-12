// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

document.observe('dom:loaded', function() {

//  BEGIN SUBMISSION TYPE HIDE/SHOW   ///////////////////////////////////
	function processSelection(thisTarget, thisSelection) {
		//alert(thisTarget + thisSelection);
		
		if (thisSelection == 1 || thisSelection == 4) {
			$('url_' + thisTarget).hide();
			$('file_' + thisTarget).show();
		} else {
			$('url_' + thisTarget).show();
			$('file_' + thisTarget).hide();
		}
	}
	
	for (var i=0; i<4; i++) {
		(function(i) {
			$('submission_works_attributes_' + i + '_type_id').observe('change', function(event) {
				var index = this.selectedIndex;
				var option = this.options[index].value;
				//alert(option);
				
				processSelection(i, option);
			});
			
			$('url_' + i).hide();
			
		})(i);
	}

//  END SUBMISSION TYPE HIDE/SHOW   /////////////////////////////////////

});