class MatchesController < ApplicationController

  def index()
    # raise
    home_matches = Match.where({home_team_id: params[:team_id]})
    away_matches = Match.where({away_team_id: params[:team_id]})
    matches = home_matches.to_a.concat(away_matches)
    render(json: matches)
  end

end