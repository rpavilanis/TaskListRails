class PeopleController < ApplicationController
  def index
    @people = Person.all

    @tasks = Task.where(person_id: params[:person_id])
    @incomplete_tasks = 0

  end

  def show
    @person = Person.find(params[:id])

    if @person == nil
      render :file => 'public/404.html',
        :status => :not_found, :layout => false
    end
  end

  def edit
  end

  def create
    @person = Person.new
    @params = params
    @person.name = params[:person][:name]

    @person.save
    redirect_to action: "people-index"
  end

  def new
    @person = Person.new
  end

  def update
  end

  def destroy
  end
end
