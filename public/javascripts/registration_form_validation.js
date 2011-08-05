$(document).ready(function() {
	
	var user_email = new LiveValidation('user_email');
	user_email.add( Validate.Presence );
	user_email.add( Validate.Email );
	
	var user_password = new LiveValidation('user_password');
	user_password.add( Validate.Presence );
	
	var user_password_confirmation = new LiveValidation('user_password_confirmation');
	user_password_confirmation.add( Validate.Confirmation, { match: 'user_password' } );
	
});