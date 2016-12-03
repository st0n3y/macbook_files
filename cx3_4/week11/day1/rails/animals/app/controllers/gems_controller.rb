class GemsController < ApplicationController

  def index
    @gems = [{type: "Ruby"}, {type: "Sapphire"}]

    respond_to do |format|
      format.html
      format.json {render :json => @gems}
    end
  end

end