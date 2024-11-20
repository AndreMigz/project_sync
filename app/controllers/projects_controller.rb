class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [ :update, :destroy ]
  def index
    @projects = Project.all
  end

  def create
    project = Project.new(project_params)

    if project.save
      redirect_to projects_path, notice: "Project added."
    else
      redirect_to projects_path, alert: "Pailed to add project. Try again."
    end
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: "Project updated."
    else
      redirect_to projects_path, alert: "Pailed to update project. Try again."
    end
  end

  def destroy
    if @project.destroy
      redirect_to projects_path, notice: "Project deleted."
    else
      redirect_to projects_path, alert: "Failed to delete project. Try again"
    end
  end

  private

  def project_params
    params.expect(project: [ :name, :client, :description ])
    params.require(:project).permit(:name, :client, :description)
  end

  def set_project
    @project = Project.find(params[:id])

    redirect_to projects_path, error: "Project not found" unless @project
  end
end
