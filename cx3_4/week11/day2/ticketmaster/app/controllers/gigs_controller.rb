class GigsController < ApplicationController

  def index()
    gigs = Gig.where({artist: params[:artist_id]})
    render(json: gigs.as_json({include: :venue}))
    # {include: :venue} will nest the venue data within the gig data.
  end

  def create()
    gig = Gig.create({
      price: params[:price], 
      date: params[:date], 
      artist_id: params[:artist_id], 
      venue_id: params[:venue_id]
    })
    
    # gigs = Gig.where({artist: params[:artist_id]})
    
    # render(json: gigs);
    render(json: gig);
  end

end