class TodosController < ApplicationController
  def index
    @todos = Todo.all.order(created_at: :desc)

    render json: @todos
  end

  def show
    @todo = Todo.find(params[:id])

    render json: @todo
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :content)
  end
end
