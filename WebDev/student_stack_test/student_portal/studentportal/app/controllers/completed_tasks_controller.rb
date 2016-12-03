class CompletedTasksController < ApplicationController

  def index()
    completed_tasks = Completed_Task.all  
    render :json => completed_tasks.to_json()
  end

end