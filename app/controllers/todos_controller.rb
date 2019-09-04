class TodosController < ApplicationController
  before_action :set_filter, only: [:index]
  before_action :set_todo, only: [:update, :destroy]

  def index
    @all_todos = Todo.where(session_id: session.id).order(:created_at)
    @filtered_todos = @all_todos.public_send(session[:filter])
  end

  def create
    Todo.create todos_params
    redirect_to todos_path
  end

  def update
    @todo&.update todos_params
    redirect_to todos_path
  end

  def destroy
    @todo&.destroy
    redirect_to todos_path
  end

  private

  def todos_params
    params.require(:todo).permit(:title, :completed, :id).merge(session_id: session.id)
  end

  def set_todo
    @todo = Todo.find_by(session_id: session.id, id: params[:id])
  end

  def set_filter
    session[:filter] = params[:filter] || session[:filter] || "all"
  end
end
