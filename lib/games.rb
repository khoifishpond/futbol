require 'csv'

class Game
  include Readable

  attr_reader :game_id,
              :season,
              :away_team_id,
              :home_team_id,
              :away_goals,
              :home_goals
              
  def initialize(row)
    @game_id ||= row["game_id"].to_i
    @season ||= row["season"].to_i
    @away_team_id ||= row["away_team_id"].to_i
    @home_team_id ||= row["home_team_id"].to_i
    @away_goals ||= row["away_goals"].to_i
    @home_goals ||= row["home_goals"].to_i
  end

  # this could be a module accross all file classes?
#   def self.file(location)
#     rows = CSV.read(location, headers: true)
#     rows.map do |row|
#       new(row)
#     end
#   end
# end