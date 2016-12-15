module ApplicationHelper

	def category_name(id)
		if id != nil
			Category.find(id).name
		end
	end

	def category_options_ids
		ids_arr = @current_user.links.pluck(:category_id).uniq

		names_arr = []
		
		ids_arr.each do |id|
			names_arr.push(Category.find(id).name)
		end

		return names_arr.zip ids_arr
	end
end