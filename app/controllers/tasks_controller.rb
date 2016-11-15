class TasksController < ApplicationController
  before_action :find_user
  before_action :find_task, except: [:index, :new, :create]

  def index
    @tasks = @user.tasks
  end

  def new
    @task = Task.new(:user_id => params[:user_id].to_i)
  end

  def create
    @params = params

    @task = Task.new(task_params)
    @task.user_id = params[:user_id].to_i
    @task.save

    redirect_to index_path( @task.user_id)

  end

  def destroy
    @task.destroy

    redirect_to root_path
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to action: "show"
    else
      # another way to redirect
      render 'edit'
    end
  end


  def show
  end

  def completion_status
    @task.update_attribute(:completed_at, Time.now)
    @task.update_attribute(:completion_status, true)

		redirect_to action: 'index'
  end

private
  def find_user
    @user = User.find_by(id: session[:user_id])
  end

  def find_task
    @task = Task.find(params[:id])
    if @task.nil?
      render :file => 'public/404.html', :status => :not_found
    end
  end

  def task_params
    params.require(:task).permit(:title, :description, :completed_at, :completion_status)
  end

end
