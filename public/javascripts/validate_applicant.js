document.observe('dom:loaded', function() {

	var applicant_firstname = new LiveValidation('applicant_firstname', {validMessage: "", onlyOnSubmit: true});
	applicant_firstname.add( Validate.Presence );
	
	var applicant_lastname = new LiveValidation('applicant_lastname', {validMessage: "", onlyOnSubmit: true});
	applicant_lastname.add( Validate.Presence );
	
	var applicant_address = new LiveValidation('applicant_address', {validMessage: "", onlyOnSubmit: true});
	applicant_address.add( Validate.Presence );
	
	var applicant_city = new LiveValidation('applicant_city', {validMessage: "", onlyOnSubmit: true});
	applicant_city.add( Validate.Presence );
	
	var applicant_zip = new LiveValidation('applicant_zip', {validMessage: "", onlyOnSubmit: true});
	applicant_zip.add( Validate.Presence );
	applicant_zip.add( Validate.Numericality, { onlyInteger: true } );
	applicant_zip.add( Validate.Length, { is: 5 } );
	
	var applicant_phone = new LiveValidation('applicant_phone', {validMessage: "", onlyOnSubmit: true});
	applicant_phone.add( Validate.Presence );
	
	var applicant_email = new LiveValidation('applicant_email', {validMessage: "", onlyOnSubmit: true});
	applicant_email.add( Validate.Presence );
	applicant_email.add( Validate.Email );

});