class UsersController < ApplicationController

	def new
	end

	def show
		@user = User.find(params[:id])
	end

	def index
    if params[:search].present?
      @users = User.search(params[:search])
      params[:search][:time_availability] = nil
    else
      params[:search] = {}
      @users = []
    end
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
	  params.require(:user).permit(:first_name, :last_name, :email, :password, :image, :twitter, :monday,
                                 :mondaytime1, :mondaytime2, :tuesday, :tuesdaytime1, :tuesdaytime2, :wednesday,
                                 :wednesdaytime1, :wednesdaytime2, :thursday, :thursdaytime1, :thursdaytime2,
                                 :friday, :fridaytime1, :fridaytime2, :saturday, :saturdaytime1, :saturdaytime2,
                                 :sunday, :sundaytime1, :sundaytime2, :job_title, :location, :industry,
                                 :occupation, :gender, :years_of_experience, :work_history)
	end

end
