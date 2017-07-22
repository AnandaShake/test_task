class UserAssignsController < ApplicationController
	before_action :require_login

	def create
    	@user_assign = UserAssign.new(user_assign_params)
    	@task = Task.find_by_id(user_assign_params[:task_id])
    	if @user_assign.save    		
  			redirect_to @task 
  		end
    end

	def new
    	@user_assign = UserAssign.new
  	end

	def show
		
	end

	def update
	
	end



	def destroy
	end

	private

	def user_assign_params
		params.require(:user_assign).permit(:user_id, :task_id)
	end

end
