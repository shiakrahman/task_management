class TasksController < ApplicationController

  def task_creation
    binding.pry
    @user = User.find_by_id(get_user_id)
    @task = @user.tasks.new(task_params)

    if @task.save
      render json: { message: "Task created successfully",  task: @task}, status: :created
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def list_tasks
    @user = User.find_by_id(get_user_id)
    @task = @user.tasks.page(params[:page]).per(params[:per_page])
    render json: @task, status: :ok
  end

  def list_tasks_by_id
    @user = User.find_by_id(get_user_id)
    @task = @user.tasks.find_by_id(params[:id])
    if @task.nil?
        render json: { message: "Task not found" }, status: :not_found
    else
        render json: @task, status: :ok
    end
  end
  def update_task_by_id
    @user = User.find_by_id(get_user_id)
    @task = @user.tasks.find_by_id(params[:id])
    if @task.nil?
        render json: { message: "Task not found" }, status: :not_found
    else
        if @task.update(task_params)
            render json: { message: "Task updated successfully",  task: @task}, status: :ok
        else
            render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
        end
    end
  end
  def delete_task_by_id
    @user = User.find_by_id(get_user_id)
    @task = @user.tasks.find_by_id(params[:id])
    if @task.nil?
        render json: { message: "Task not found" }, status: :not_found
    else
        @task.destroy
        render json: { message: "Task deleted successfully" }, status: :ok
    end
  end


  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status)
  end
end
