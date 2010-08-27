# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	
	def current_user
		return current_juror
	end
	
	def sortable(column, title = nil)
		title ||= column.titleize
		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
		link_to title, :sort => column, :direction => direction
	end
	
end
