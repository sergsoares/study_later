class LinksController < ApplicationController

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

  private
	def link_params
		params.require(:link).permit(:name, :link, :category)
	end

end
