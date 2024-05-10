class TaskGroupsController < ApplicationController
  before_action :set_task_group, only: [:show, :edit, :destroy, :update]

  def index
    @task_groups = TaskGroup.active
  end

  def show
  end

  def new
    @task_group = TaskGroup.new
  end

  def create
    @task_group = TaskGroup.new task_group_params
    if @task_group.save
      redirect_to task_groups_path, notice: 'Task group was successfully created'
    else
      render :new, alert: 'Task group could not be created'
    end
  end

  def edit
  end

  def update
    if @task_group.update(task_group_params)
      redirect_to task_groups_path(@task_group), notice: 'Task group was successfully updated'
    else
      render :edit, alert: 'Task group could not be updated'
    end
  end

  def destroy
    if @task_group.destroy
      redirect_to task_groups_path, notice: "Task group destroyed successfully"
    else
      redirect_to task_groups_path, alert: "Task group not destroyed successfully"
    end
  end

  private
    def set_task_group
      @task_group = TaskGroup.find(params[:id])
    end

    def task_group_params
      params.require(:task_group).permit(:title, :position, :status)
    end
end
