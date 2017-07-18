class TasklistsController < ApplicationController
	def create
		@project = Project.find(params[:project_id])
		@tasklist = @project.tasklists.create(tasklist_params)
		redirect_to project_path(@project)
	end

	def destroy
		@project = Project.find(params[:project_id])
		@tasklist = @project.tasklists.find(params[:id])
		@tasklist.destroy
		redirect_to project_path(@project)
	end

	private
	def tasklist_params
		params.require(:tasklist).permit(:name, :project_id)
	end
end
