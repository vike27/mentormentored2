class UsersController < ApplicationController

	def new
	end

	def show
		@user = User.find(params[:id])
	end

	def index
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find_by_id(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "User updated successfully!"
			redirect_to user_path
		else 
			flash[:danger] = "User could not be updated!"
		end
	end

	def destroy
	end


	def user_params
	  params.require(:user).permit(:first_name, :last_name, :email, :password, :image)
	end

end
