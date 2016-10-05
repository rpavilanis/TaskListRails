class TasksController < ApplicationController
  def index

    @person = Person.find( params[:person_id].to_i)
    @tasks = @person.tasks
  end

  def new
    @task = Task.new
    @people = Person.all
  end

  def create
    @params = params

    @task = Task.new
    @task.title = params[:task][:title]
    @task.description = params[:task][:description]
    @task.person_id = params[:person_id].to_i
    @task.save

    redirect_to index_path(@task.id, params[:person_id])

  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to action: "index"

  end

  def edit
    @task = Task.find(params[:id])

    if @task == nil
          render :file => 'public/404.html',
              :status => :not_found
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task == nil
          render :file => 'public/404.html',
              :status => :not_found
    end

    if @task.update(title: params[:task][:title], description: params[:task][:description])
      redirect_to action: "show"
    else
      # another way to redirect
      render 'edit'
    end
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
    @task.update_attribute(:completion_status, true)

		redirect_to action: 'index'

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
