class TasklistsController < ApplicationController
	before_action :require_login
    before_action :set_tasklist, only: [:show, :edit, :update, :destroy]


	def create
		@project = Project.find(params[:project_id])
		@tasklist = @project.tasklists.create(tasklist_params)
		redirect_to project_path(@project)
	end

	def show
		
	end

	def update
	
	end



	def destroy
		@project = Project.find(params[:project_id])
		@tasklist = @project.tasklists.find(params[:id])
		@tasklist.destroy
		@task = Task.where(tasklist_id: params[:id]).to_a
		@task.each do |task|
			@user_assign = UserAssign.where(task_id: task.id)
    		@user_assign.each do |us|
      			us.destroy
    		end
			task.destroy
		end
		redirect_to project_path(@project)
	end

	private
	def set_tasklist
		@project = Project.find(params[:project_id])
		@tasklist = @project.tasklists.find(params[:id])
    end

	def tasklist_params
		params.require(:tasklist).permit(:name, :project_id)
	end
end
