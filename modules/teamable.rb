module Teamable
  def team_info(team_id)
    info = {
      team_id: get_team_with_id(team_id).team_id,
      franchise_id: get_team_with_id(team_id).franchise_id,
      team_name: get_team_with_id(team_id).team_name,
      abbreviation: get_team_with_id(team_id).abbreviation
    }
    info
  end

  def get_team_with_id(team_id)
    @teams.find do |team|
      team.team_id == team_id
    end
  end
end