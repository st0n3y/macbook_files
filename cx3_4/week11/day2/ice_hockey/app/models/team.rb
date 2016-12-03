class Team < ApplicationRecord
  
  has_many :players
  has_many :matches_as_home_team, :class_name => 'Match', :foreign_key => 'home_team_id'
  has_many :matches_as_away_team, :class_name => 'Match', :foreign_key => 'away_team_id'

end