class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @mytask = Task.new
  end

  def create
    @params = params
    @mytask = Task.new
    @mytask.title = params[:task][:title]
    @mytask.description = params[:task][:description]
    @mytask.save
    redirect_to action: "index"

    # Task.create(title: params[:title], description: params[:description])
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(title: params[:title], description: params[:description])
      redirect_to action: "show"
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to action: "index"

  end

  def edit
    @task = Task.find(params[:id])
  end

  def show
    @task = Task.find(params[:id])

    if @task == nil
      render :file => 'public/404.html',
        :status => :not_found, :layout => false
    end
  end

  def completion_status
    @task = Task.find(params[:id])

    @task.update_attribute(:completed_at, Time.now)

		redirect_to action: 'index', notice: "task item completed"

  end

  # used this before creating model
  # def self.alltasks
  # [
  #   {id: 1, title: "Clean Bathroom", description: "wash towels, scour sink, clean bathtub", completion_status: true, completed_at:Time.now},
  #   {id: 2, title: "Read", description: "read for 20 minutes", completion_status: false},
  #   {id: 3, title: "Exercise", description: "yoga, run for 30 minutes", completion_status: true, completed_at:Time.now}
  # ]
  #
  # end
end
