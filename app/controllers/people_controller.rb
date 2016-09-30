class PeopleController < ApplicationController
  def index
    @people = Person.all
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
  end

  def new
    @person = Person.new
  end

  def update
  end

  def destroy
  end
end
