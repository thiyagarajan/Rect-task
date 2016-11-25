class ProjectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def new
    @developer = Developer.find(params[:developer_id])
    @project = @developer.projects.build
  end

  def create
    @developer = Developer.find(params[:developer_id])
    @project = @developer.projects.build(project_params)

    if @project.save
      flash[:success] = 'Project saved'
      redirect_to projects_path
    else
      flash[:danger] = 'Project could not be saved'
      render :new
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
