class TasksController < ApplicationController
  def index
    render json: {
      meta: {
        count: Task.count,
        page: 0
      },
      tasks: Task.all
    }
  end

  def create
    if task = Task.create(task_params)
      render json: { task: task }
    else
      render json: {
        message: "Could not create Task",
        errors: task.errors,
      }, status: :unprocessible_entity
    end
  end

  def update
    task = task.find(params[:id])

    if task.update(task_params)
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

  def task_params
    params.require(:task).permit(:title, :body, :finished, :end_date)
  end
end
