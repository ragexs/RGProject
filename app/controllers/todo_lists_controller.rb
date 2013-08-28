class TodoListsController < ApplicationController
  before_filter :signed_in_user
  before_filter :correct_user
  def index
    @todo_lists = current_user.todo_lists
  end
  def show
    @todo_list = TodoList.find(params[:id])

  end
  def new
    @todo_list = TodoList.new
  end
  def edit
    @todo_list = TodoList.find(params[:id])
  end
  def create
    @todo_list = current_user.todo_lists.build(params[:todo_list])
    if @todo_list.save
      redirect_to @todo_list
    else
      render 'new'
    end
  end
  def update
    @todo_list = TodoList.find(params[:id])
    if @todo_list.update_attributes(params[:todo_list])
      redirect_to todo_list_path(@todo_list)
    else
      render 'edit'
    end
  end
  def add_task
    @todo_list = TodoList.find(params[:id])

    @task.update_attributes(todo_list_id: params[:todo_list_id])
    if @task.save
      redirect_to tasks_path
    else
      render 'tasks/new'
    end

  end
  def destroy
    @todo_list = TodoList.find(params[:id])
    @todo_list.destroy
    redirect_to todo_lists_path
  end
  def correct_user
    @todo_list = current_user.todo_lists.find_by_id(params[:id])
  end

end
