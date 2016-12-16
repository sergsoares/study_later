require 'open-uri'

module ApplicationHelper

	def category_name(id)
		if id != nil
			Category.find(id).name
		end
	end

	def category_options_ids
		ids_arr = @current_user.categories.pluck(:id)

		names_arr = []
		ids_arr.each do |id|
			if !id.nil?
				names_arr.push(Category.find(id).name)
			end
		end

		return names_arr.zip ids_arr
	end

	def thumbnail_link(id)
		path = 'app/assets/images/'+id.to_s+'.png'

		if File.exist?(path)
			id.to_s+'.png'
		else
			object = LinkThumbnailer.generate('http://stackoverflow.com')
			open(path, 'wb') do |file|
		   		file << open(object.images.first.src.to_s).read
		 	end
		 	id.to_s+'.png'
		end

	end 

	def thumbnail_download(link)
		object = LinkThumbnailer.generate(link.link)

		open('app/assets/images/'+link.id.to_s+".png", 'wb') do |file|
			file << open(object.images.first.src.to_s).read
		end

	end
end