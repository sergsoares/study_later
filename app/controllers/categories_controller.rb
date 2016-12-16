class CategoriesController < ApplicationController
	
	def new
		@category = Category.new
	end

	def create
		user = current_user
		category = user.categories.new(category_params)

		if category.save
			flash[:success] = "Category Saved"
			render template: "pages/add"
		else
			flash[:warning] = "Fail, Try save category again"
			redirect_to category_path
		end

	end

	private
	def category_params
		params.require(:category).permit(:name)
	end

end
