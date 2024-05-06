class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
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

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to task_path(@task), notice: "Task updated successfully"
    else
      render :edit, notice: "Task not updated successfully"
    end
  end

  def destroy
    @task = Task.find(params[:id])

    if @task.destroy
      redirect_to tasks_path, notice: "Task destroyed successfully"
    else
      redirect_to tasks_path, notice: "Task not destroyed successfully"
    end
  end

  private

    def task_params
      params.require(:task).permit(:title, :description)
    end
end
