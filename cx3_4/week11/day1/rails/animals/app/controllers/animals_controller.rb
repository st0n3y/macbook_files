class AnimalsController < ApplicationController

  def index
    @animals = [{name: "Tiger"}, {name: "Snow Leopard"}]
    
    # Tells the controller what formats to serve up:
    respond_to do |format|
      format.html
      format.json {render :json => @animals}
      # format.json {render ({:json => animals})}
    end
  end

end