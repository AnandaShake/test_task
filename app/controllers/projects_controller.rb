class ProjectsController < ApplicationController
  before_action :require_login
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    #@projects = Project.select('name, description').where('user_id' = current_user.id)
    @projects = Project.where(user_id: current_user.id).to_a
    #puts @projects.inspect
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    #@projects = Project.where(["user_id = ? and id = ?", current_user.id, params[:id]]).to_a
    #User.where(["name = ? and email = ?", "Joe", "joe@example.com"])
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        @project.update_column :user_id, current_user.id
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end


    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @tasklist = Tasklist.where(project_id: @project.id)
    @tasklist.each do |tasklist|
      @task = Task.where(tasklist_id: tasklist.id)
      @task.each do |task|
        task.files.each {|file| file.remove!}
        @user_assign = UserAssign.where(task_id: task.id)
        @user_assign.each do |us|
            us.destroy
        end
        @task_tag = TaskTag.where(task_id: task.id)
        @task_tag.each do |task_tag|
          task_tag.destroy
        end
        task.destroy
      end
      tasklist.destroy
    end
    @project.destroy


    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params[:user_id] = current_user.id
      params.require(:project).permit(:name, :description, :user_id)
    end
end
