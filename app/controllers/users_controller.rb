class UsersController < ApplicationController

  def new
  end

  def show
    @user = User.find(params[:id])
    @unread_messages = @user.mailbox.inbox({:read => false}).count
  end

  def index
    if params[:search].present?
      if params[:search].values.any? { |i| i.present? }
        @users = User.search(params[:search], current_user.id)
      else
        recommend_user
      end
      params[:search][:time_availability] = nil
    else
      params[:search] = {}
      recommend_user
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.form_submitted = true
    if @user.update_attributes(user_params)
      flash[:success] = "User updated successfully!"
      redirect_to user_path
    else
      flash[:danger] = "User could not be updated!"
    end
  end

  def destroy
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :image, :twitter, :monday,
                                   :mondaytime1, :mondaytime2, :tuesday, :tuesdaytime1, :tuesdaytime2, :wednesday,
                                   :wednesdaytime1, :wednesdaytime2, :thursday, :thursdaytime1, :thursdaytime2,
                                   :friday, :fridaytime1, :fridaytime2, :saturday, :saturdaytime1, :saturdaytime2,
                                   :sunday, :sundaytime1, :sundaytime2, :job_title, :location, :industry,
                                   :occupation, :gender, :years_of_experience, :work_history,
                                   :private_twitter, :private_industry, :private_job_title, :private_location,
                                   :private_occupation, :private_gender, :private_work_history,
                                   :private_years_of_experience)
    end

    def recommend_user
      if current_user
        params[:search][:location] = current_user.location
        @users = User.search(params[:search], current_user.id)
      else
        @users = []
      end
    end

end
