class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
    user = current_user
  	if logged_in? && user.id.to_s == params[:id] 
    	@user = User.find(params[:id])
	  end
  end

  def create
  	@user = User.new(user_params)
    begin
      	if @user.save
      		log_in @user
      		flash[:success] = "Start save links for study later"
      		redirect_to @user
      	else
          flash[:warning] = "Create Fail, Try Again"
      		render 'new'
       	end
    rescue => e
      flash[:warning] = "Email already exists"
      render 'new'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  	end
end