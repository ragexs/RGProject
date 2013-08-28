class TasksController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :load_current_todo_list, only: [:index,:create, :new]
  def index
    @tasks = @todo_list.tasks
  end
  def show
    @task = Task.find(params[:id])
  end
  def new
    @task = @todo_list.tasks.build
  end
  def edit
    @task = Task.find(params[:id])
  end
  def create

    @task = @todo_list.tasks.build(params[:task])
    if @task.save
      redirect_to todo_list_tasks_path(@todo_list,@task)
    else
      render 'new'
    end
  end
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task
    else
      render 'edit'
    end
  end
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  def load_current_todo_list
    @todo_list = TodoList.find(params[:todo_list_id])
  end
end
