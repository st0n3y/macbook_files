class StadiaController < ApplicationController
  
  def index()
    stadia = Stadium.all
    render(json: stadia)
  end

  def show()
    stadium = Stadium.find(params[:id])
    render(json: stadium)
  end

  def create()
    stadium = Stadium.create({
      name: params[:name], 
      capacity: params[:capacity],
      location: params[:location]
      })
    render(json: stadium)
  end

  def update()
    stadium = Stadium.find(params[:id])
    stadium.update({
      name: params[:name],
      capacity: params[:capacity],
      location: params[:location]
      })
    render(json: stadium)
  end

  def destroy()
    stadium = Stadium.find(params[:id])
    stadium.destroy
    index
  end

end