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

  def best_season(team_id)
    seasons_win_percentage = hash_season_games_won_percentage_by_team_id(team_id)
    seasons_win_percentage.key(seasons_win_percentage.values.max)
  end

  def worst_season(team_id)
    seasons_win_percentage = hash_season_games_won_percentage_by_team_id(team_id)
    seasons_win_percentage.key(seasons_win_percentage.values.min)
    require 'pry'; binding.pry
  end
  
  def hash_season_games_won_percentage_by_team_id(team_id)
    season_games_won_percentage = {}
    hash_games_by_season(team_id).each do |key_season, value_games|
      season_games_won_percentage[key_season] = value_games.count do |game|
        (game.away_team_id == team_id && game.away_goals > game.home_goals) ||
        (game.home_team_id == team_id && game.home_goals > game.away_goals)
      end.fdiv(value_games.count).round(2)
    end
    season_games_won_percentage
  end

  def hash_games_by_season(team_id)
    array_games_by_team_id(team_id).group_by do |game|
      game.season
    end
  end

  def array_games_by_team_id(team_id)
    @games.find_all do |game|
      game.away_team_id == team_id || game.home_team_id == team_id
    end
  end
end