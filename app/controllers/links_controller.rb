class LinksController < ApplicationController

	def index
		@user = User.find(current_user)
		# @links = @user.links.all
		@links = @user.links.paginate(page: params[:page])
		# @current_user.links.distinct.pluck(:category).uniq
	end

	def create
		@user = User.find(params[:user_id])
		@link = @user.links.create(link_params)
		# redirect_to link_path(@link)
		redirect_to @user
	end

	def destroy
		@user = User.find(params[:user_id])
		@link = @user.links.find(params[:id])
		@link.destroy
		redirect_to @user
	end

	def search
		@user = User.find(current_user)
		@links = @user.links.where("title like ?", "%#{params[:options][:title]}%").paginate(page: params[:page])
	end

	private
	def link_params
		params.require(:link).permit(:title, :link, :category)
	end


end
