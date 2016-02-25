class TasksController < ApplicationController
  before_action :set_project
  def index
    render json: {
      meta: {
        count: Task.count,
        page: 0
      },
      tasks: @project.tasks.order(:finished, :id)
    }
  end

  def create
    task = Task.new
    task.project = @project

    if task = Task.save
      render json: { task: task }
    else
      render json: {
        message: "Could not create Task",
        errors: task.errors,
      }, status: :unprocessible_entity
    end
  end

  def update
    task = @project.tasks.find(params[:id])

    if task.update
      render json: { task: task }
    else
      render json: {
        message: "Could not update Task",
        errors: task.errors,
      }, status: :unprocessible_entity
    end
  end

  def destroy
    task = task.find(params[:id])

    if task.destroy
      render json: { task: nil }
    else
      render json: {
        message: "Could not destroy Task, please try again",
      }, status: :unprocessible_entity
    end
  end

  private

  def set_project
     @project = Project.find(params[:project_id])
   end

  def task_params
    params.require(:task).permit(:title, :body, :finished, :end_date)
  end
end
