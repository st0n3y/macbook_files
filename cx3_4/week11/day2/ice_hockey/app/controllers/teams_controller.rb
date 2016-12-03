class TeamsController < ApplicationController
  
  def index()
    teams = Team.all
    render(json: teams)
  end

  def show()
    team = Team.find(params[:id])
    render(json: team)
  end

  def create()
    team = Team.create({
      name: params[:name], 
      location: params[:location]
      })
    render(json: team)
  end

  def update()
    team = Team.find(params[:id])
    team.update({
      name: params[:name],
      location: params[:location]
      })
    render(json: team)
  end

  def destroy()
    team = Team.find(params[:id])
    team.destroy
    index
  end

end