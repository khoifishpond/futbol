require 'csv'

class GameTeam
  include Readable

  attr_reader :game_id,
              :team_id,
              :result,
              :head_coach,
              :goals,
              :shots,
              :tackles
              
  def initialize(row)
    @game_id ||= row["game_id"].to_i
    @team_id ||= row["team_id"].to_i
    @result ||= row["result"]
    @head_coach ||= row["head_coach"]
    @goals ||= row["goals"].to_i
    @shots ||= row["shots"].to_i
    @tackles ||= row["tackles"].to_i
  end

  # this could be a module accross all file classes?
#   def self.file(location)
#     rows = CSV.read(location, headers: true)
#     rows.map do |row|
#       new(row)
#     end
#   end
# end