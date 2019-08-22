class TodosController < ApplicationController
  before_action :set_todo

  def index
    @filter ||= Filter.new(value: session[:filter] || "all")
    @all_todos = Todo.where(session_id: session.id).order(:created_at)
    @filtered_todos = @filter.apply(@all_todos)
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
    params.require(:todo).permit(:title, :completed).merge(session_id: session.id)
  end

  def set_todo
    @todo = Todo.find_by(session_id: session.id, id: params[:id])
  end
end
