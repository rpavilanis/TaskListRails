class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
  end

  def create
    Task.create(title: params[:title], description: params[:description])
    redirect_to action: "index"
  end

  def update
  end

  def destroy
    # Task.destroy{}
  end

  def edit
  end

  def show
    @tasks = Task.all
    @mytask = nil

    @tasks.each do |task|
      number = params[:id].to_i
      if number == task[:id]
        @mytask = task
      end
    end
      if @mytask == nil
        render :file => 'public/404.html',
          :status => :not_found, :layout => false
      end
  end

  # def self.alltasks
  # [
  #   {id: 1, title: "Clean Bathroom", description: "wash towels, scour sink, clean bathtub", completion_status: true, completed_at:Time.now},
  #   {id: 2, title: "Read", description: "read for 20 minutes", completion_status: false},
  #   {id: 3, title: "Exercise", description: "yoga, run for 30 minutes", completion_status: true, completed_at:Time.now}
  # ]
  #
  # end
end
