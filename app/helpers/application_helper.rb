module ApplicationHelper
	
	def full_title(page_title = '')
		base_title = "CryBerry"
		if page_title.empty?
			base_title
		else
			page_title + " | " + base_title
		end
	end

	def active_class(path)
		'active' if current_page?(path)
	end
end
