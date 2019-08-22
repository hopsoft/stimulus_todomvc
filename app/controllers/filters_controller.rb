class FiltersController < ApplicationController
  def create
    session[:filter] = params[:filter]
    head :ok
  end
end
