require_relative '../modules/readable'
require 'csv'

class Team
  extend Readable

  attr_reader :team_id,
              :franchise_id,
              :team_name,
              :abbreviation
              
  def initialize(row)
    @team_id ||= row["team_id"].to_i
    @franchise_id ||= row["franchiseId"].to_i
    @team_name ||= row["teamName"]
    @abbreviation ||= row["abbreviation"]
  end
end