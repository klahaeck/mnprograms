# app/models/permissions.rb
class Permissions < Aegis::Permissions
	
	role :administrator, :default_permission => :allow
	role :judge
	#role :registered_user
	#role :guest
	
	permission :edit_program do |user, program|
		allow :administrator
	end
	
	permission :create_program do |user, program|
		allow :administrator
	end
	
	permission :view_program do |user, program|
		allow :everyone
	end  
	 
end

# Read more: http://www.agileweboperations.com/role-based-permissions-for-your-ruby-on-rails-application/#ixzz0s5fZBo7q