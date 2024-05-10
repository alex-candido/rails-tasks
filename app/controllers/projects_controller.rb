class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :destroy, :update]

  def index
    @projects = Project.active
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params
    if @project.save
      redirect_to projects_path, notice: 'Project was successfully created'
    else
      render :new, alert: 'Project could not be created'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path(@project), notice: 'Project was successfully updated'
    else
      render :edit, notice: 'Project could not be updated'
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: "Project destroyed successfully"
    else
      redirect_to projects_path, alert: "Project not destroyed successfully"
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :status)
    end
end
