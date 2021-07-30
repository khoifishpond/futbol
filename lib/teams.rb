require 'csv'

class Team
  include Readable

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

  # this could be a module accross all file classes?
#   def self.file(location)
#     rows = CSV.read(location, headers: true)
#     rows.map do |row|
#       new(row)
#     end
#   end
# end