class ProjectsController < ApplicationController
  def index
    render json: {
      meta: {
        count: Project.count,
        page: 0
      },
      projects: Project.order(:title)
    }
  end

    # def show
    #   project = Project.find(params[:id])
    #   render json: {
    #     project: project,
    #     tasks: project.tasks
    #   }
    # end

  def create
    if project = Project.create(project_params)
      render json: { project: project }
    else
      render json: {
        message: "Could not create Project",
        errors: project.errors,
      }, status: :unprocessible_entity
    end
  end

  def update
    project = Project.find(params[:id])

    if project.update(project_params)
      render json: { project: project }
    else
      render json: {
        message: "Could not update Project",
        errors: project.errors,
      }, status: :unprocessible_entity
    end
  end

  def destroy
    project = Project.find(params[:id])

    if project.destroy
      render json: { project: nil }
    else
      render json: {
        message: "Could not destroy Project, please try again",
      }, status: :unprocessible_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :body, :finished, :end_date)
  end
end
