class TaskTagsController < ApplicationController
	before_action :require_login

	def create
    	@task_tag = TaskTag.new(task_tag_params)
    	@task = Task.find_by_id(task_tag_params[:task_id])
    	if @task_tag.save    		
  			redirect_to @task 
  		end
    end

	def new
    	@task_tag = TaskTag.new
  	end

	private

	def task_tag_params
		params.require(:task_tag).permit(:task_id, :tag)
	end

end
