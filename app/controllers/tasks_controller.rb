class TasksController < ApplicationController
  before_action :set_task, only: %w(show, edit, destroy, update)

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new task_params
    if @task.save
      redirect_to tasks_path, notice: "Task saved successfully"
    else
      render :new, alert: "Task not saved successfully"
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to task_path(@task), notice: "Task updated successfully"
    else
      render :edit, alert: "Task not updated successfully"
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: "Task destroyed successfully"
    else
      redirect_to tasks_path, alert: "Task not destroyed successfully"
    end
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:title, :description, :status, :task_group_id)
    end
end
