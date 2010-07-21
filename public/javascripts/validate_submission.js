document.observe('dom:loaded', function() {

	var submission_statement = new LiveValidation('submission_statement', {validMessage: "", onlyOnSubmit: true, onInvalid:function(){
			this.insertMessage( this.createMessageSpan() );
			this.addFieldClass();
			scrollUp();
		}
	});
	submission_statement.add( Validate.Presence, {failureMessage: "You must submit an artist statement!"} );
	
	var submission_resume = new LiveValidation('submission_resume', {validMessage: "", onlyOnSubmit: true, onInvalid:function(){
			this.insertMessage( this.createMessageSpan() );
			this.addFieldClass();
			scrollUp();
		}
	});
	submission_resume.add( Validate.Presence, {failureMessage: "You must submit a resume PDF!"} );
	submission_resume.add( Validate.Format, { pattern: /.pdf/i, failureMessage: "This must be a PDF file!" } );
	
	function scrollUp() {
		$('header').scrollTo();
	}

});