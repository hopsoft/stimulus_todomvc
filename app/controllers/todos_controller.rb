class TodosController < ApplicationController
  before_action :set_filter, only: [:index]
  before_action :set_todo, only: [:update, :destroy]
  before_action :set_all_todos, only: [:index, :bulk_update]

  def index
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

  def bulk_update
    toggle_todos
    redirect_to todos_path
  end

  private

  def set_all_todos
    @all_todos = Todo.where(session_id: session.id).order(:created_at)
  end

  def toggle_todos
    if @all_todos.any?(&:active?)
      @all_todos.update_all(completed: true)
    else
      @all_todos.update_all(completed: false)
    end
  end

  def todos_params
    params.require(:todo).permit(:title, :completed).merge(session_id: session.id)
  end

  def set_todo
    @todo = Todo.find_by(session_id: session.id, id: params[:id])
  end

  def set_filter
    session[:filter] = params[:filter] || session[:filter] || "all"
  end
end
