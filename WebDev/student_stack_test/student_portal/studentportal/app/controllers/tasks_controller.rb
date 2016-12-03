class TasksController < ApplicationController
  
  def index()
    tasks = Task.all  
    render :json => tasks.to_json()
  end

  def show()
    task = Task.find(params[:id])
    render(json: task)
  end

  private
  def task_params()
    params.require(:task).permit(:name)
  end

end