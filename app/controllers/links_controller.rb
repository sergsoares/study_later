require 'open-uri'

class LinksController < ApplicationController

	def index
		@user = User.find(current_user)
		@links = @user.links.paginate(page: params[:page])
	end
	
	def create
		@user = User.find(params[:user_id])
		link = @user.links.new(link_params)
		if link.save
			begin
				object = LinkThumbnailer.generate(link.link)
				open('app/assets/images/'+link.id.to_s+".png", 'wb') do |file|
					file << open(object.images.first.src.to_s).read
				end
				link.update_attributes(title: object.title ,path: link.id.to_s+".png" )
			rescue => e
				link.update_attributes(title: link.link ,path: "default-news-image.jpg" )
			end

				flash[:success] = "Link Saved"
				redirect_to links_path
			
		else
			flash[:warning] = "Fail, Try copy link again"
			render template: "pages/add"
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@link = @user.links.find(params[:id])
		@link.destroy
		redirect_to links_path
	end

	def search
		user = current_user
		if params[:options][:id] == ""
			@links = user.links.where("title like ?", "%#{params[:options][:title]}%").paginate(page: params[:page])
		else
			@links = user.links.where("title like ? and category_id = ?", "%#{params[:options][:title]}%", params[:options][:id] ).paginate(page: params[:page])						
		end
		render 'index'
	end

	private
	def link_params
		params.require(:link).permit(:title, :link,:category_id)
	end
end
