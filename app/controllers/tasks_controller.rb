class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params
    if @task.save
      redirect_to tasks_path, notice: "Task saved successfully"
    else
      render :new, notice: "Task not saved successfully"
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  private

    def task_params
      params.require(:task).permit(:title, :description)
    end
end