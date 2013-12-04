module ApplicationHelper
	
	def sortable(column, start_date, end_date,  title = nil)
  		title ||= column.titleize
  		css_class = column == sort_column ? "current #{sort_direction}" : nil
  		direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
  		link_to title, {:search => {start_date: start_date, end_date: end_date}, :sort => column, :direction => direction, :commit => "sortable"}, {:class => css_class}
	end

end	
